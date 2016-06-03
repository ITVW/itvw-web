class CreateVaporwave < ActiveRecord::Migration
  def change
    create_table :vaporwaves do |t|
      t.references :user, index: true, foreign_key: true
      t.binary :image, null: false
      t.integer :score, null: false

      t.timestamps null: false
    end
  end
end
