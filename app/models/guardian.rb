class Guardian < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :relationships
  has_many :contacts
  has_many :tasks
  has_many :children, through: :relationships
end
