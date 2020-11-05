class AddColumnToFormulas < ActiveRecord::Migration[6.0]
  def change
    add_column :formulas, :author, :integer
  end
end
