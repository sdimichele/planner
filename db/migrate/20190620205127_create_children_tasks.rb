class CreateChildrenTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :children_tasks do |t|
      t.integer :child_id
      t.integer :task_id

      t.timestamps
    end
  end
end
