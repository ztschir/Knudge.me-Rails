class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.datetime :timeStamp
      t.string :name
      t.decimal :amount
      t.boolean :debitOrCredit
      t.integer :category_id

      t.timestamps
    end
  end
end
