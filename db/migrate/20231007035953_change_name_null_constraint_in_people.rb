class ChangeNameNullConstraintInPeople < ActiveRecord::Migration[7.0]
  def change
    change_column :people, :name, :string, null: false
  end
end
