class RenamePersonIdToApplicants < ActiveRecord::Migration[7.0]
  def change
    rename_column :applicant_articles, :person_id, :applicant_id
  end
end
