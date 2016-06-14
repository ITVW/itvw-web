require 'test_helper'

class UsersRegistrationTest < ActionDispatch::IntegrationTest
  test "invalid nickname registration" do
    assert_no_difference 'User.count' do
      post users_path, user: { carrier_id: 1,
                               phone:      1234567890,
                               nickname:   "invalid_nickname"
                              }
    end
    assert_response :bad_request
  end
  
  test "valid nickname registration" do
    assert_difference 'User.count' do
      post users_path, user: { carrier_id: 1,
                               phone:      1234567890,
                               nickname:   "validNickname"
                              }
    end
    assert_response :ok
  end
end
