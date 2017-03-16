class Address < ApplicationRecord
  belongs_to :agreement
  validates :street, presence: true

  require 'batch_factory'

  def self.generateAgreements(file)
    hash_worksheet = BatchFactory.from_file file, sheet_number: 1, keys: [:city, :street, :number]
    map = hash_worksheet.map {|row| row[:number]}
    map.each do |t|
      if Agreement.find_by(number: t).nil?
        Agreement.create(number: t, company_id: 1)
      end
    end
  end

  def self.createAddresses(file)
    hash_worksheet = BatchFactory.from_file file, sheet_number: 1, keys: [:city, :street, :number]
    json = hash_worksheet.rows.to_json
    JSON.parse(json).each do |t|
      dogovor = Agreement.find_by(number: t['number']).id
      Address.create(street: t['street'], city: t['city'], agreement_id: dogovor)
    end
  end
end
