class AddAppearColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :appeared_at, :string
    add_column :users, :appeared_on, :string
  end
end
