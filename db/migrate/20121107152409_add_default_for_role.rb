class AddDefaultForRole < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :role, :string, default: 'member'
    end
  end
end
