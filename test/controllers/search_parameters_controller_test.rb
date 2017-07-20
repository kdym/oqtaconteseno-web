require 'test_helper'

class SearchParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_parameter = search_parameters(:one)
  end

  test "should get index" do
    get search_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_search_parameter_url
    assert_response :success
  end

  test "should create search_parameter" do
    assert_difference('SearchParameter.count') do
      post search_parameters_url, params: { search_parameter: { distancia: @search_parameter.distancia, periodo: @search_parameter.periodo, tipos: @search_parameter.tipos, user_id: @search_parameter.user_id } }
    end

    assert_redirected_to search_parameter_url(SearchParameter.last)
  end

  test "should show search_parameter" do
    get search_parameter_url(@search_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_parameter_url(@search_parameter)
    assert_response :success
  end

  test "should update search_parameter" do
    patch search_parameter_url(@search_parameter), params: { search_parameter: { distancia: @search_parameter.distancia, periodo: @search_parameter.periodo, tipos: @search_parameter.tipos, user_id: @search_parameter.user_id } }
    assert_redirected_to search_parameter_url(@search_parameter)
  end

  test "should destroy search_parameter" do
    assert_difference('SearchParameter.count', -1) do
      delete search_parameter_url(@search_parameter)
    end

    assert_redirected_to search_parameters_url
  end
end
