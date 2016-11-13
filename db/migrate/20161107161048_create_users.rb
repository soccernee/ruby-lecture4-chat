class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.datetime :last_online_at
      t.string :appearing_on

      t.timestamps
    end
  end
end
