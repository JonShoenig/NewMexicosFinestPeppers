class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :product_id
    end
    add_index :orders, :user_id
  end
end
