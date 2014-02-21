class AddDetailsToClientTable < ActiveRecord::Migration
  def change
    add_column :clients, :weight, :decimal
    add_column :clients, :dob, :date
    add_column :clients, :gender, :string
    add_column :clients, :address, :text
  end
end
