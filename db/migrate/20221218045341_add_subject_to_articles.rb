# frozen_string_literal: true

class AddSubjectToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :subject, :integer, null: false, default: 0
  end
end
