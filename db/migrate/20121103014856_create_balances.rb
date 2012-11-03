class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.string :email
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end
