class CreateFormulas < ActiveRecord::Migration[6.0]
  def change
    create_table :formulas do |t|
      t.string :name
      t.decimal :hydration
      t.decimal :salt
      t.decimal :starter
      t.decimal :preferment

      t.timestamps
    end
  end
end
