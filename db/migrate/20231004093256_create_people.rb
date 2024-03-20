# frozen_string_literal: true

class Createapplicant < ActiveRecord::Migration[7.0]
  def change
    create_table :applicant do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
