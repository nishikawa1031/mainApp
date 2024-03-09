class ChangePeopleToApplicant < ActiveRecord::Migration[7.0]
  def change
    rename_table :people, :applicants
  end
end
