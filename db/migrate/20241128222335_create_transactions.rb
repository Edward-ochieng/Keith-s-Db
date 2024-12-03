class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :amount
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
