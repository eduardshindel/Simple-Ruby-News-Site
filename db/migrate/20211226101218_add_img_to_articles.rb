class AddImgToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :img, :string
  end
end
