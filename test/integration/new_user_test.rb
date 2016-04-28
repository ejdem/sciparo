require 'test_helper'

class UserNewTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:adam)
    end
    
    test "invalid new user" do
        get new_user_path
        assert_no_difference 'User.count' do
            post users_path, user: { name: "" }
        end
        assert_template 'users/new'
    end
    
    test "valid new user" do
        get new_user_path
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: {name: "Test"}
        end
        assert_template 'instructs'
        assert is_logged_in?
    end
end