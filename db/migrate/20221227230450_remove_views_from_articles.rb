# frozen_string_literal: true

class RemoveViewsFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :views, :integer
  end
end
