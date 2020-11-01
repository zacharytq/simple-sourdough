class CreateFormulas < ActiveRecord::Migration[6.0]
  def change
    create_table :formulas do |t|
      t.string :name
      t.decimal :hydration, precision: 4, scale: 3
      t.decimal :salt, precision: 4, scale: 3
      t.decimal :starter, precision: 4, scale: 3
      t.decimal :preferment, precision: 4, scale: 3

      t.timestamps
    end
  end
end
