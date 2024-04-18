class RemoveCreaterIdFromApplicants < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :creater_id, :integer
  end
end
