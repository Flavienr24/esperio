class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :status
      t.boolean :visibility
      t.boolean :open_to_apply
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
