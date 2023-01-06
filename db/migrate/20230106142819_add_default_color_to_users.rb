class AddDefaultColorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :default_color, :string, default: 'blue'
  end
end
