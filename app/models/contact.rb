class Contact < ApplicationRecord
  belongs_to :guardian
  validates :name, presence: true
end
