class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :department
      t.string :position
      t.integer :user_id

      t.timestamps
    end
  end
end
