class AddColumnsToApplicant < ActiveRecord::Migration[7.0]
    def change
      add_column :applicants, :birthday, :date
      add_column :applicants, :age, :integer
      add_column :applicants, :nationality, :integer
      add_column :applicants, :phone_number, :integer
      add_column :applicants, :self_introduction, :text
      add_column :applicants, :desired_salary, :text
    end
  end
  