class Task < ApplicationRecord
  belongs_to :guardian, optional: true #completing the task
  has_many :children_tasks
  has_many :children, through: :children_tasks

  validates :name, presence: true
  validates :time, presence: true 

  enum status: {pending: 0, completed: 1, waiting: 2 }


  # def format_time
  #   time.strftime("%m-%e-%y %H:%M")
  # end

  # def format_untime
  #   time.strptime("time", "%Y-%m-%dT%H:%MZ")
  # end
end
