require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  before_action :logged_in_user

  def create
  end

  def destroy
  end
  test "create should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      post :create
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      delete :destroy, id: relationships(:one)
    end
    assert_redirected_to login_url
  end
end