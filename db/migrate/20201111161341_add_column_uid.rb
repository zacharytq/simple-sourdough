class AddColumnUid < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :email, :string
  end
end
