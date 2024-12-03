class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.integer :target_amount
      t.integer :current_amount
      t.integer :user_id
      t.string :name
      t.integer :deadline

      t.timestamps
    end
  end
end
