class RemoveFileFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :file, :string
  end
end
