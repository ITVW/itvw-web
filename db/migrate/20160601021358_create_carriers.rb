class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name, index: true
      t.string :email_address

      t.timestamps null: false
    end
  end
end
