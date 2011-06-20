require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  fixtures :people

  test "filter by postcode and email" do
    rules = [Include_postcodes_rule.new("2000", :include_postcodes),
    Include_email_rule.new("hotmail", :include_email)]
    
    people = Person.filter_by_params(rules)
    
    assert_equal(1, people.size)
    assert_equal('Cody Kinnaman', people.first.name)
  end
  
  test "filter by all parameters" do
    rules = [Include_postcodes_rule.new("2000", :include_postcodes),
    Exclude_postcodes_rule.new("2065", :exclude_postcodes),
    Include_email_rule.new("gmail", :include_email),
    Exclude_email_rule.new("hotmail", :exclude_email)]
    
    people = Person.filter_by_params(rules)

    assert_equal(1, people.size)
    assert_equal('Erik Pendergast', people.first.name)
  end
  
end
