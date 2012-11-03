class AddTotalToBalances < ActiveRecord::Migration
  def change
    add_column :balances, :total, :decimal
  end
end
