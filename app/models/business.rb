class Business < ActiveRecord::Base
  validates :name, :street, :city, :state, :country, presence: true

  def address
    [street, city, state, country].compact.join(", ")
  end

  geocoded_by :address
  after_validation :geocode
end
