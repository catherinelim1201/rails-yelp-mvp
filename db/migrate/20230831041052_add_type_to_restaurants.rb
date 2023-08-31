class AddTypeToRestaurants < ActiveRecord::Migration[7.0]
  def change
    # string because number might have +65...
    add_column :restaurants, :phone_number, :string
  end
end
