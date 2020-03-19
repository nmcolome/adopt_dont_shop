class Pet < ApplicationRecord
  belongs_to :shelter

  enum sex: [:female, :male]
  enum status: [:adoptable, :pending]
end
