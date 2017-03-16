class CreateAgreements < ActiveRecord::Migration[5.0]
  def change
    create_table :agreements do |t|
      t.string :number
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
