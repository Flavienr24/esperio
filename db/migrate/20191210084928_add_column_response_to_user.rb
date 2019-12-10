class AddColumnResponseToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :response, :float
  end
end
