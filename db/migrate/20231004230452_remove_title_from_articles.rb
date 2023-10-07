# frozen_string_literal: true

class RemoveTitleFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :title, :string
    remove_column :articles, :comment, :text
  end
end
