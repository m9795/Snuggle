class AddPublishToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :publish, :boolean, null: false, default: true
  end
end
