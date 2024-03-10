class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :area
      t.string :location
      t.string :website_url
      t.string :string

      t.timestamps
    end
  end
end
