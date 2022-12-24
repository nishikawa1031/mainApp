class AddCommentToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :comment, :text
  end
end
