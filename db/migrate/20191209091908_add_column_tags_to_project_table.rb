class AddColumnTagsToProjectTable < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_tags, :string, array: true, default: []
  end
end
