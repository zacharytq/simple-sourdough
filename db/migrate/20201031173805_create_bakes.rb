class CreateBakes < ActiveRecord::Migration[6.0]
  def change
    create_table :bakes do |t|
      t.integer :total_weight
      t.text :process
      t.integer :rating
      t.integer :user_id
      t.integer :formula_id

      t.timestamps
    end
  end
end
