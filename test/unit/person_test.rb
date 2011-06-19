require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  fixtures :people

  test "filter by postcode and email" do
    people = Person.filter_by_params({:include_email=>'hotmail', :include_postcodes=>'2000'})
    assert_equal(1, people.size)
    assert_equal('Cody Kinnaman', people.first.name)
  end
  
end
