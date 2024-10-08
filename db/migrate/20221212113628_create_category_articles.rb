# frozen_string_literal: true

class CreateCategoryArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :category_articles do |t|
      t.references :category, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
