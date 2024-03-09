class ChangePersonArticlesToApplicantArticles < ActiveRecord::Migration[7.0]
  def change
    rename_table :person_articles, :applicant_articles
  end
end
