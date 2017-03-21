class Agency < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  #        :confirmable

  validates :name, presence: true, uniqueness: true

  # validates :email, presence: true, uniqueness: true

end
