class Responder < ApplicationRecord

  devise :database_authenticatable, :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :work_histories, dependent: :destroy

  has_many :aquired_certifications
  has_many :certifications, through: :aquired_certifications

  has_many :certifications, as: :creator

  geocoded_by :zipcode
  after_validation :geocode, :if => :zipcode_changed?


  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/images/:style/no-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def name
    "#{first_name} #{last_name}"
  end

  def location_url
    "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{latitude}%2C#{longitude}"
  end

  private

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |responder|
      responder.email = auth.info.email
      responder.password = Devise.friendly_token[0, 20]
      name = auth.info.name.split(' ')
      responder.first_name = name[0] # assuming the responder model has a name
      responder.last_name = name[1]
      # responder.avatar = auth.info.image # assuming the responder model has an image
    end
  end
end
