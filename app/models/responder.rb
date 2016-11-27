class Responder < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  # has_attached_file :avatar, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/images/:style/no-avatar.png'
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  delegate :avatar, to: :responder_profile

  has_many :work_histories
end
