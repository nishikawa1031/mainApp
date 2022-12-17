class AddColumnArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :views, :integer
    add_column :articles, :likes, :integer
  end
end
