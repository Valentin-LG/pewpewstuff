# frozen_string_literal: true

require 'test_helper'

class PistonHeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piston_head = piston_heads(:one)
  end

  test 'should get index' do
    get piston_heads_url, as: :json
    assert_response :success
  end

  test 'should create piston_head' do
    assert_difference('PistonHead.count') do
      post piston_heads_url,
           params: { piston_head: { brand: @piston_head.brand, material: @piston_head.material, on_bearing: @piston_head.on_bearing, price: @piston_head.price, reference: @piston_head.reference, silenced: @piston_head.silenced, weight: @piston_head.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show piston_head' do
    get piston_head_url(@piston_head), as: :json
    assert_response :success
  end

  test 'should update piston_head' do
    patch piston_head_url(@piston_head),
          params: { piston_head: { brand: @piston_head.brand, material: @piston_head.material, on_bearing: @piston_head.on_bearing, price: @piston_head.price, reference: @piston_head.reference, silenced: @piston_head.silenced, weight: @piston_head.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy piston_head' do
    assert_difference('PistonHead.count', -1) do
      delete piston_head_url(@piston_head), as: :json
    end

    assert_response :no_content
  end
end
