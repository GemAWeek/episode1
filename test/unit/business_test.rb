require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  def setup
    @business = Business.new(name: "Google", street: "2400 Bayshore Parkway",
      city: "Mountain View", state: "CA", country: "United States")
  end
  test "should be valid with valid attributes" do
    assert @business.valid?
  end

  test "should reject a Business without a name" do
    @business.name = ""
    assert !@business.save
  end

  test "should reject a Business without a street" do
    @business.street = ""
    assert !@business.save
  end

  test "should reject a Business without a city" do
    @business.city = ""
    assert !@business.save
  end

  test "should reject a Business without a state" do
    @business.state = ""
    assert !@business.save
  end

  test "should reject a Business without a country" do
    @business.country = ""
    assert !@business.save
  end

  test "should have an address that combines address components" do
    assert_not_nil @business.address
  end

  test "address should be a formatted address" do
    assert_equal("2400 Bayshore Parkway, Mountain View, CA, United States", @business.address)
  end
end
