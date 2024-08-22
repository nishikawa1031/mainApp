# frozen_string_literal: true

class ChangeNameNullConstraintInApplicants < ActiveRecord::Migration[7.0]
  def change
    change_column :applicants, :name, :string, null: false
  end
end
