class CreateFormulaAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :formula_authors do |t|
      t.integer :user_id
      t.integer :formula_id

      t.timestamps
    end
  end
end
