class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.integer :login_attempts
      t.datetime :expires_at
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
