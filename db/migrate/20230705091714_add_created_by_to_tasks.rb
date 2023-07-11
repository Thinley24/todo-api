class AddCreatedByToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :created_by, :string
  end
end
