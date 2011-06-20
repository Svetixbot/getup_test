require 'test_helper'

# Validation test

class Postcode_rule_test < ActiveSupport::TestCase
  fixtures :people

  test "non-numbers should not be valid" do
    rule = Postcodes_rule.new("2034, dgg", :include_postcodes)
    assert_equal false, rule.valid?
  end
  
  test "white space should be valid" do
    rule = Postcodes_rule.new("    ", :include_postcodes)
    assert_equal true, rule.valid?
  end
  
  test "list of postcodes separeted with commas should be valid" do
      rule = Postcodes_rule.new("2000, 2065", :include_postcodes)
      assert_equal true, rule.valid?
  end
  
end
