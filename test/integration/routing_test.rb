require 'test_helper'
 
class UserFlowsTest < ActionController::IntegrationTest
  fixtures :people
 
  test "path for show doesn't change" do
    get "/people/show"
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal '/people/show', path
  end
  
  test "path for filtering should be people/filter" do 
    post_via_redirect "/people/filter", :include_postcodes=>"2000"
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal 'people/filter', path
  end
  
  test "path after submit clear should be people/show" do  
    post_via_redirect "people/clear"
    assert_response :success
    assert_equal '/people/show', path
  end
  
end