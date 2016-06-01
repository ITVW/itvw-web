class CreateVaporwaves < ActiveRecord::Migration
  def change
    create_table :vaporwaves do |t|
      t.references :user, index: true, foreign_key: true
      t.binary :image
      t.integer :score

      t.timestamps null: false
    end
  end
end
