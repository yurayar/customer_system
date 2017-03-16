class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.references :agreement, foreign_key: true

      t.timestamps
    end
  end
end
