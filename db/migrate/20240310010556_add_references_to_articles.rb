class AddReferencesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :company, null: false, foreign_key: true
  end
end
