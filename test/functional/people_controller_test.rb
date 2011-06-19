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
  
end
