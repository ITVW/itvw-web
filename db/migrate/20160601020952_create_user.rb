class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :carrier, index: true, foreign_key: true
      t.string :phone, null: false
      t.string :nickname, index: true, null: false

      t.timestamps null: false
    end
  end
end
