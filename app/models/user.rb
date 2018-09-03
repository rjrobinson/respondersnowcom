class User < ApplicationRecord

  devise :database_authenticatable, :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :work_histories, dependent: :destroy

  has_many :acquired_certifications
  has_many :certifications, through: :acquiredCertifications

  has_many :certifications, as: :creator

  has_one_attached :avatar

  geocoded_by :zipcode

  after_validation :geocode, :if => :zipcode_changed?


  def full_name
    name
  end

  def name
    "#{first_name} #{last_name}"
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