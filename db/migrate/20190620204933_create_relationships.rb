class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :guardian_id
      t.integer :child_id
      t.boolean :parent

      t.timestamps
    end
  end
end
