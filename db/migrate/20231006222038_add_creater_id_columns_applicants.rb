# frozen_string_literal: true

class AddCreaterIdColumnsApplicants < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :creater_id, :integer, null: false
  end
end
