# frozen_string_literal: true

class RemoveLikesFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :likes, :integer
  end
end
