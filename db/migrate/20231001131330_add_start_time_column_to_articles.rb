class AddStartTimeColumnToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :start_time, :datetime
    add_column :articles, :end_time, :datetime
  end
end
