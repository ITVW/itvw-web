class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :session_key, index: true
      t.string :auth_code, index: true
      t.date :last_auth_attempt
      t.date :last_active

      t.timestamps null: false
    end
  end
end
