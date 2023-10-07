# frozen_string_literal: true

class CreatePersonArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :person_articles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
