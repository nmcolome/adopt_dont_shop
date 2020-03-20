class Pet < ApplicationRecord
  belongs_to :shelter

  validates_presence_of :image, :name, :description, :approximate_age, :sex, :shelter_id, message: "Field required"

  enum sex: [:female, :male]
  enum status: [:adoptable, :pending]
end
