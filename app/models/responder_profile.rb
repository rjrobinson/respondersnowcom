class ResponderProfile < ApplicationRecord

  geocoded_by :zipcode
  after_validation :geocode, :if => :zipcode_changed?
  

  belongs_to :responder
  has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/images/:style/no-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
