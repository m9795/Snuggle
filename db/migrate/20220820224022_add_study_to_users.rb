class AddStudyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :study_content, :string
    add_column :users, :target, :string
    add_column :users, :sleeping_time, :string
    add_column :users, :studying_time, :string
    add_column :users, :relax, :string
    add_column :users, :fighting, :string
    add_column :users, :favorite_color, :string
    add_column :users, :favorite_cafe, :string
    add_column :users, :favorite_drink, :string
    add_column :users, :favorite_food, :string
  end
end
