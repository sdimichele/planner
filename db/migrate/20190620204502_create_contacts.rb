class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :guardian_id
      t.string :name
      t.string :picture
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
