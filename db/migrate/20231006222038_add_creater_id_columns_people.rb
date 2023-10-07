# frozen_string_literal: true

class AddCreaterIdColumnsPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :creater_id, :integer, null: false
  end
end
