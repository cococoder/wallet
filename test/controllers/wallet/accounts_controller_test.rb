require 'test_helper'

module Wallet
  class AccountsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @account = wallet_accounts(:one)
    end

    test "should get index" do
      get accounts_url, as: :json
      assert_response :success
    end

    test "should create account" do
      assert_difference('Account.count') do
        post accounts_url, params: { account: { tag: @account.tag } }, as: :json
      end

      assert_response 201
    end

    test "should show account" do
      get account_url(@account), as: :json
      assert_response :success
    end

    test "should update account" do
      patch account_url(@account), params: { account: { tag: @account.tag } }, as: :json
      assert_response 200
    end

    test "should destroy account" do
      assert_difference('Account.count', -1) do
        delete account_url(@account), as: :json
      end

      assert_response 204
    end
  end
end
