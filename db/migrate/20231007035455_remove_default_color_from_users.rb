class RemoveDefaultColorFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :default_color, :string
  end
end
