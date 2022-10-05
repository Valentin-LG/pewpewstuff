# frozen_string_literal: true

require 'test_helper'

class CylinderHeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cylinder_head = cylinder_heads(:shs)
  end

  test 'should get index' do
    get cylinder_heads_url, as: :json
    assert_response :success
  end

  test 'should create cylinder_head' do
    assert_difference('CylinderHead.count') do
      post cylinder_heads_url,
           params: { cylinder_head: { brand: @cylinder_head.brand, for_replica: @cylinder_head.for_replica, material: @cylinder_head.material, o_ring: @cylinder_head.o_ring, price: @cylinder_head.price, reference: @cylinder_head.reference, silenced: @cylinder_head.silenced, weight: @cylinder_head.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show cylinder_head' do
    get cylinder_head_url(@cylinder_head), as: :json
    assert_response :success
  end

  test 'should update cylinder_head' do
    patch cylinder_head_url(@cylinder_head),
          params: { cylinder_head: { brand: @cylinder_head.brand, for_replica: @cylinder_head.for_replica, material: @cylinder_head.material, o_ring: @cylinder_head.o_ring, price: @cylinder_head.price, reference: @cylinder_head.reference, silenced: @cylinder_head.silenced, weight: @cylinder_head.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy cylinder_head' do
    assert_difference('CylinderHead.count', -1) do
      delete cylinder_head_url(@cylinder_head), as: :json
    end

    assert_response :no_content
  end
end
