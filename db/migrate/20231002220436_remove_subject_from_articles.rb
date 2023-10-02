class RemoveSubjectFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :subject, :integer
    remove_column :articles, :year, :integer
    remove_column :articles, :answer, :boolean
  end
end
