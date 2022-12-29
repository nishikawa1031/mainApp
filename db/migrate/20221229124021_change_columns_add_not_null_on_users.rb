# frozen_string_literal: true

class ChangeColumnsAddNotNullOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :username, false
  end
end
