class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :session_key, index: true, null: false
      t.string :auth_code, index: true, null: false
      t.datetime :last_auth_attempt, null: false
      t.datetime :last_active, null: false

      t.timestamps null: false
    end
  end
end
