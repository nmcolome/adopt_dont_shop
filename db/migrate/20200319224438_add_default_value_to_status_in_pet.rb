class AddDefaultValueToStatusInPet < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, :status, :integer, default: 0
  end
end
