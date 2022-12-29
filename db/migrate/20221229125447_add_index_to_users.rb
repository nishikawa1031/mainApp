# frozen_string_literal: true

class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change; end
  add_index :users, :username, unique: true
end
