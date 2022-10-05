# frozen_string_literal: true

require 'test_helper'

class SpringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spring = springs(:one)
  end

  test 'should get index' do
    get springs_url, as: :json
    assert_response :success
  end

  test 'should create spring' do
    assert_difference('Spring.count') do
      post springs_url,
           params: { spring: { brand: @spring.brand, linear: @spring.linear, price: @spring.price, reference: @spring.reference, spires: @spring.spires } }, as: :json
    end

    assert_response :created
  end

  test 'should show spring' do
    get spring_url(@spring), as: :json
    assert_response :success
  end

  test 'should update spring' do
    patch spring_url(@spring),
          params: { spring: { brand: @spring.brand, linear: @spring.linear, price: @spring.price, reference: @spring.reference, spires: @spring.spires } }, as: :json
    assert_response :success
  end

  test 'should destroy spring' do
    assert_difference('Spring.count', -1) do
      delete spring_url(@spring), as: :json
    end

    assert_response :no_content
  end
end
