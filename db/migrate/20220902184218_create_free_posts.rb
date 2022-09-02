class CreateFreePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :free_posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :content,  null: false

      t.timestamps
    end
  end
end
