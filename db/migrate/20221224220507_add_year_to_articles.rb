class AddYearToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :year, :integer
  end
end
