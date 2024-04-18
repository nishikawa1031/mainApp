class RemoveCompanyIdFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :company_id, :bigint
  end
end
