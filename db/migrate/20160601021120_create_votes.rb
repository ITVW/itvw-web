class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :vaporwave, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :vote

      t.timestamps null: false
    end
  end
end
