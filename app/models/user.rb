class User < ApplicationRecord
  has_merit

  devise :database_authenticatable, :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :work_histories, dependent: :destroy

  has_many :acquired_certifications
  has_many :certifications, through: :acquired_certifications

  has_many :certifications, as: :creator

  has_one_attached :avatar

  has_many :votes

  geocoded_by :zipcode

  after_validation :geocode, :if => :zipcode_changed?


  Certification::CODES.each do |code|
    define_method :"#{code.gsub(' ', '_').downcase}_certs" do
      acquired_certifications.where(certification_id: Certification.where(course_code: code).pluck(:id))
    end
  end


  def can_confirm?
    true
  end

  def display_id
    "#{last_name[0]}#{id}NJ".downcase
  end

  def certs_sorted_by_name
    acquired_certifications.joins(:certification).order('certifications.name')
  end

  def full_name
    name
  end

  def name
    "#{first_name} #{last_name}"
  end


  def primaries
    acquired_certifications
  end

  def location_url
    "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{latitude}%2C#{longitude}"
  end

  private

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      name = auth.info.name.split(' ')
      user.first_name = name[0] # assuming the user model has a name
      user.last_name = name[1]
      #

      # user.avatar = auth.info.image # assuming the user model has an image
    end
  end
end
