class Agreement < ApplicationRecord
  belongs_to :company
  has_many :addresses, inverse_of: :agreement
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  validates :number, presence: true
end
