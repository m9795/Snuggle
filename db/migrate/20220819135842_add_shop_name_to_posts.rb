class AddShopNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :shop_name, :string
    add_column :posts, :shop_detail, :string
    add_column :posts, :shop_place, :string
    add_column :posts, :shop_home_page, :text
    add_column :posts, :shop_remarks, :string
  end
end
