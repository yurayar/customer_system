class Company < ApplicationRecord
  has_many :agreements
  validates :name, presence: true
end
