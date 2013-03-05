class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_to
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
