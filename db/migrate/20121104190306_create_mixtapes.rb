class CreateMixtapes < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end
