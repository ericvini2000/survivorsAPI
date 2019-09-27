class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.boolean :abducted
      t.float :lat
      t.float :long
      t.integer :gender
      t.integer :abduction_reports

      t.timestamps
    end
  end
end
