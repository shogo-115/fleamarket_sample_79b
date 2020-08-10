class AddBuyerToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :buyerId, :integer
  end
end
