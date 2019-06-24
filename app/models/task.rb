class Task < ApplicationRecord
  belongs_to :guardian, optional: true #completing the task
  has_many :children_tasks
  has_many :children, through: :children_tasks

  enum status: {pending: 0, completed: 1, waiting: 2 }
end
