require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'Should list a list of approved companies' do
    get companies_path
    assert_response :success
    assert_select 'h1', 'EMPRESAS'
    assert_select '.companies-total', "Total de empresas: #{Company.visible.count}"
  end

  test 'Should filter companies with query' do
    get companies_path, params: { query: 'Two' }
    assert_response :success
    assert_select '.companies-total', "Total de empresas: 1"
  end
end
