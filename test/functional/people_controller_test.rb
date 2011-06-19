require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
 
  setup do
    @person = people(:person_1)
  end
  
  test "should get show" do
    get :show
    assert_response :success
    assert_not_nil assigns(:people)
  end
  
# Acceptance tests from GetUp task (look at README) 

  test "should get people with postcodes" do
    post(:filter , {'include_postcodes' => '2000,2010'})
    assert_equal(4, assigns[:people].count)
  end
  
  test "should get people by email domain" do
    post(:filter , {'include_email' => 'hotmail'})
    assert_equal(2, assigns[:people].count)
  end
  
  test "should get people exclude with postcode" do
    post(:filter , {'exclude_postcodes' => '2000'})
    assert_equal(8, assigns[:people].count)
  end
  
  test "should get people with postcode and email domain" do
    post(:filter , {'include_postcodes' => '2010', 'include_email' => 'gmail'})
    assert_equal(1, assigns[:people].count)
  end  
  
  test "should get people with poscodes exclude email domain" do
    post(:filter , {'include_postcodes' => '2060, 2061, 2065', 'exclude_email' => 'gmail'})
    assert_equal(1, assigns[:people].count)
  end
  
end
