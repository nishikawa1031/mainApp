class RemoveDisplayNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :display_name, :string
  end
end
