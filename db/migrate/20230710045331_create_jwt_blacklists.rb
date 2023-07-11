class CreateJwtBlacklists < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_blacklists do |t|
      t.string :token
      t.index :token

      t.timestamps
    end
    add_index :jwt_blacklists, :token, unique: true, if_not_exists: true
  end
end
