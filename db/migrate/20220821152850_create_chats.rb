class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.integer :room_id, null: false, foreign_key: true
      t.string :message,     null: false

      t.timestamps
    end
  end
end
