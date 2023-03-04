# frozen_string_literal: true

require 'application_system_test_case'

class UserSearchesTest < ApplicationSystemTestCase
  setup do
    @user_search = user_searches(:one)
  end

  test 'visiting the index' do
    visit user_searches_url
    assert_selector 'h1', text: 'User searches'
  end

  test 'should create user search' do
    visit user_searches_url
    click_on 'New user search'

    fill_in 'Date search', with: @user_search.date_search
    fill_in 'Make', with: @user_search.make
    fill_in 'Model', with: @user_search.model
    fill_in 'Price from', with: @user_search.price_from
    fill_in 'Price to', with: @user_search.price_to
    fill_in 'User', with: @user_search.user_id
    fill_in 'Year from', with: @user_search.year_from
    fill_in 'Year to', with: @user_search.year_to
    click_on 'Create User search'

    assert_text 'User search was successfully created'
    click_on 'Back'
  end

  test 'should update User search' do
    visit user_search_url(@user_search)
    click_on 'Edit this user search', match: :first

    fill_in 'Date search', with: @user_search.date_search
    fill_in 'Make', with: @user_search.make
    fill_in 'Model', with: @user_search.model
    fill_in 'Price from', with: @user_search.price_from
    fill_in 'Price to', with: @user_search.price_to
    fill_in 'User', with: @user_search.user_id
    fill_in 'Year from', with: @user_search.year_from
    fill_in 'Year to', with: @user_search.year_to
    click_on 'Update User search'

    assert_text 'User search was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User search' do
    visit user_search_url(@user_search)
    click_on 'Destroy this user search', match: :first

    assert_text 'User search was successfully destroyed'
  end
end
