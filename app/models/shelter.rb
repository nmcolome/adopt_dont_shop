class Shelter < ApplicationRecord
  has_many :pets
  validates_presence_of :name, :address, :city, :state, :zip, message: "Field required"

  def self.state_abbr
    [
      ["ALABAMA", "AL"],
      ["ALASKA", "AK"],
      ["ARIZONA", "AZ"],
      ["ARKANSAS", "AR"],
      ["CALIFORNIA", "CA"],
      ["COLORADO", "CO"],
      ["CONNECTICUT", "CT"],
      ["DELAWARE", "DE"],
      ["FLORIDA", "FL"],
      ["GEORGIA", "GA"],
      ["HAWAII", "HI"],
      ["IDAHO", "ID"],
      ["ILLINOIS", "IL"],
      ["INDIANA", "IN"],
      ["IOWA", "IA"],
      ["KANSAS", "KS"],
      ["KENTUCKY", "KY"],
      ["LOUISIANA", "LA"],
      ["MAINE", "ME"],
      ["MARYLAND", "MD"],
      ["MASSACHUSETTS", "MA"],
      ["MICHIGAN", "MI"],
      ["MINNESOTA", "MN"],
      ["MISSISSIPPI", "MS"],
      ["MISSOURI", "MO"],
      ["MONTANA", "MT"],
      ["NEBRASKA", "NE"],
      ["NEVADA", "NV"],
      ["NEW HAMPSHIRE", "NH"],
      ["NEW JERSEY", "NJ"],
      ["NEW MEXICO", "NM"],
      ["NEW YORK", "NY"],
      ["NORTH CAROLINA", "NC"],
      ["NORTH DAKOTA", "ND"],
      ["OHIO", "OH"],
      ["OKLAHOMA", "OK"],
      ["OREGON", "OR"],
      ["PENNSYLVANIA", "PA"],
      ["RHODE ISLAND", "RI"],
      ["SOUTH CAROLINA", "SC"],
      ["SOUTH DAKOTA", "SD"],
      ["TENNESSEE", "TN"],
      ["TEXAS", "TX"],
      ["UTAH", "UT"],
      ["VERMONT", "VT"],
      ["VIRGINIA", "VA"],
      ["WASHINGTON", "WA"],
      ["WEST VIRGINIA", "WV"],
      ["WISCONSIN", "WI"],
      ["WYOMING", "WY"]
    ]
  end

  def self.sort_by_adoptable_pets
    joins(:pets).where("pets.status = 0").group(:id).order("COUNT(pets.id) DESC", :id)
  end

  def self.sort_by_name
    order(name: :asc)
  end
end
