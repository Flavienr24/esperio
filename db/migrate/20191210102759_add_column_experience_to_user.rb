class AddColumnExperienceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :experience, :string
  end
end
