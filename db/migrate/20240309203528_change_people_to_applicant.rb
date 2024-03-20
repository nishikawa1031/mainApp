class ChangeapplicantToApplicant < ActiveRecord::Migration[7.0]
  def change
    rename_table :applicant, :applicants
  end
end
