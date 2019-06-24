class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :guardian_id
      t.string :name
      t.text :description
      t.datetime :time
      t.integer :status

      t.timestamps
    end
  end
end
