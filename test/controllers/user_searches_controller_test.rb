require 'test_helper'

class UserSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_search = user_searches(:one)
  end

  test 'should get index' do
    get user_searches_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_search_url
    assert_response :success
  end

  test 'should create user_search' do
    assert_difference('UserSearch.count') do
      post user_searches_url,
           params: { user_search: { date_search: @user_search.date_search, make: @user_search.make, model: @user_search.model,
                                    price_from: @user_search.price_from, price_to: @user_search.price_to, user_id: @user_search.user_id, year_from: @user_search.year_from, year_to: @user_search.year_to } }
    end

    assert_redirected_to user_search_url(UserSearch.last)
  end

  test 'should show user_search' do
    get user_search_url(@user_search)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_search_url(@user_search)
    assert_response :success
  end

  test 'should update user_search' do
    patch user_search_url(@user_search),
          params: { user_search: { date_search: @user_search.date_search, make: @user_search.make, model: @user_search.model,
                                   price_from: @user_search.price_from, price_to: @user_search.price_to, user_id: @user_search.user_id, year_from: @user_search.year_from, year_to: @user_search.year_to } }
    assert_redirected_to user_search_url(@user_search)
  end

  test 'should destroy user_search' do
    assert_difference('UserSearch.count', -1) do
      delete user_search_url(@user_search)
    end

    assert_redirected_to user_searches_url
  end
end
