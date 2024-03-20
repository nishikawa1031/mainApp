# frozen_string_literal: true

class AddCreaterIdColumnsapplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicant, :creater_id, :integer, null: false
  end
end
