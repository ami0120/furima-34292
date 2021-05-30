class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :postal_code,    nill: false
      t.string     :prefecture_id,  nill: false
      t.string     :municipality,   nill: false
      t.string     :address,        nill: false
      t.string     :building_name
      t.string     :phone_number,   nill: false
      
      t.timestamps
    end
  end
end
