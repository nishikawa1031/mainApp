# frozen_string_literal: true

class ChangeNameNullConstraintInApplicant < ActiveRecord::Migration[7.0]
  def change
    change_column :applicant, :name, :string, null: false
  end
end
