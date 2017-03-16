class AddAgreementNumberToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :agreement_number, :string
  end
end
