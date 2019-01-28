class CreateTestCases < ActiveRecord::Migration[5.2]
  def change
    create_table :test_cases do |t|
      t.string :description
      t.integer :project_id
      t.integer :status, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
