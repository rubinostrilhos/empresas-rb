require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "Should redirect to login if user is not logged in" do
    get companies_path
    assert_redirected_to new_user_session_path
  end

  test 'Should list a list of approved companies' do
    user = users(:user)
    sign_in user
    get companies_path
    assert_response :success
    assert_select 'h1', 'EMPRESAS'
    assert_select '.companies-total', "Total de empresas: #{Company.visible.count}"
  end

  test 'Should filter companies with query' do
    user = users(:user)
    sign_in user
    get companies_path, params: { query: 'Two' }
    assert_response :success
    assert_select '.companies-total', "Total de empresas: 1"
  end
end
