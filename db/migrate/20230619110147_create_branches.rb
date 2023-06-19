class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :stream
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
