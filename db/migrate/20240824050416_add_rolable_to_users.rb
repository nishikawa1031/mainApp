class AddRolableToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :rolable, polymorphic: true, index: true
  end
end
