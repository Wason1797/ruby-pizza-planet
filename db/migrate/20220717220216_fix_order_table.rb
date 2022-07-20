class FixOrderTable < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :client_name, :string
    add_column :orders, :client_dni, :string
    add_column :orders, :client_address, :string
    add_column :orders, :client_phone, :string
    add_column :orders, :total_price, :float
    add_reference :orders, :sizes, index: true
  end
end
