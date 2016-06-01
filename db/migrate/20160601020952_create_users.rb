class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :carrier, index: true, foreign_key: true
      t.string :phone
      t.string :nickname, index: true

      t.timestamps null: false
    end
  end
end
