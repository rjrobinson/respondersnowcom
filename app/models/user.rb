# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :registerable, :trackable, :recoverable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_merit

  typed_store :settings do |s|
    s.string :theme, default: "light"
    s.boolean :anon, default: true
    s.boolean :peroidic_updates, default: true
  end

  # VALIDATORS
  validates :first_name, presence: true
  validates :last_name, presence: true

  # WORK HISTORIES & PROFILE INFORMATION
  has_many :work_histories, dependent: :destroy
  has_many :acquired_certifications
  has_many :certifications, through: :acquired_certifications
  has_many :certifications, as: :creator

  #  Mark for removal?
  has_one_attached :avatar

  has_many :votes

  has_many :county_subscriptions
  has_many :counties, through: :county_subscriptions


  geocoded_by :zipcode

  after_validation :geocode, if: :zipcode_changed?

  after_create :send_notification

  def send_notification
    AdminMailer.new_user(user: self).deliver
  end


  Certification::CODES.each do |code|
    define_method :"#{code.gsub(' ', '_').downcase}_certs" do
      acquired_certifications.where(certification_id: Certification.where(course_code: code).pluck(:id))
    end
  end

  def can_confirm?
    true
  end

  def display_id
    uid == "RNBot" ? "RN-Bot" : "#{last_name[0]}0#{id[0..3]}".upcase
  end

  def incidents
    Incident.where(county_id: county_subscriptions.pluck(:county_id))
  end

  def certs_sorted_by_name
    acquired_certifications.joins(:certification).order('certifications.name')
  end

  def name
    "#{first_name} #{last_name}"
  end

  def full_name
    name
  end

  def primaries
    acquired_certifications
  end

  def location_url
    "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{latitude}%2C#{longitude}"
  end

  def stripe_customer
    Stripe::Customer.retrieve(stripe_id)
  end

  def subscriptions
    stripe_customer.subscriptions
  end

  def subscription
    subscriptions.first
  end

  def cancel_subscription
    subscriptions.first.delete
  end

  def currently_subscribed?
    subscription.present?
  end

  def create_subscription(plan: Subscription::PLANS[:monthly])
    raise NoStripeIDError if stripe_id.nil?
    Stripe::Subscription.create(
        customer: stripe_id,
        items:    [
                      {
                          plan: plan,
                      },
                  ]
    )
  end

  def update_stripe_data(stripe_data:)
    assign_attributes(
        stripe_id:    stripe_data[:stripe_id],
        stripe_token: stripe_data[:stripe_token]
    )

    if card_last4?
      save if changed?
    else
      save
      update_card_info
    end
  end


  private

  def update_card_info
    customer = Stripe::Customer.retrieve(stripe_id)
    card     = customer.sources.create(source: "tok_amex")
    # todo ^^ CHANGE tok_amex to actual token in Prod ^^
    #
    update_attributes(card_last4:     card.last4,
                      card_exp_month: card.exp_month,
                      card_exp_year:  card.exp_year,
                      card_brand:     card.brand,


    )
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email      = auth.info.email
      user.password   = Devise.friendly_token[0, 20]
      name            = auth.info.name.split(' ')
      user.first_name = name[0] # assuming the user model has a name
      user.last_name  = name[1]
      # user.avatar = auth.info.image # assuming the user model has an image
    end
  end
end
