class AddArticleColumns < ActiveRecord:: Migration[7.0]
  def change
    add_column :articles, :title, :string 
    add_column :articles, :application_deadline, :date 
    add_column :articles, :salary_details, :text 
    add_column :articles, :work_location, :string 
    add_column :articles, :language_requirement, :string 
    add_column :articles, :japanese_level, :string 
    add_column :articles, :skills_required, :text 
    add_column :articles, :employment_type, :string 
    add_column :articles, :description, :text 
    add_column :articles, :work_hours, :string 
    add_column :articles, :trial_period, :string 
    add_column :articles, :days_off, :string 
    add_column :articles, :overtime, :string 
    add_column :articles, :transportation, :string 
    add_column :articles, :work_environment, :string 
    add_column :articles, :other_allowances, :string 
    add_column :articles, :insurance, :string 
    add_column :articles, :other_benefits, :string 
    add_column :articles, :status, :integer
  end
end
