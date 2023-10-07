# frozen_string_literal: true

class AddCascadeDeleteToPersonArticles < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :person_articles, :articles
    add_foreign_key :person_articles, :articles, on_delete: :cascade
  end
end
