# frozen_string_literal: true

class RemoveStatusFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :status, :integer
  end
end
