class AddCreaterIdColumnsPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :person, :creater_id, :integer, null: false
  end
end
