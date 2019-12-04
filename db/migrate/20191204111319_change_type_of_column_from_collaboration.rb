class ChangeTypeOfColumnFromCollaboration < ActiveRecord::Migration[5.2]
  def change
    change_column :collaborations, :joined, :string
  end
end
