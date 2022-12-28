# frozen_string_literal: true

class AddCommentToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :comment, :text
  end
end
