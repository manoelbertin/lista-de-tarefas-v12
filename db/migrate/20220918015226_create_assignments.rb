class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :description
      t.boolean :resolved

      t.timestamps
    end
  end
end
