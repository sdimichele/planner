class Child < ApplicationRecord

  has_many :relationships
  has_many :children_tasks
  has_many :tasks, through: :children_tasks
  has_many :guardians, through: :relationships


end
