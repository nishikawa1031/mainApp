class CreateApplicantArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :applicant_articles do |t|
      t.bigint :applicant_id
      t.bigint :article_id

      t.timestamps
    end
  end
end
