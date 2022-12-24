class AddAnswerToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :answer, :boolean
  end
end
