# frozen_string_literal: true

require 'test_helper'

class JointHopUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @joint_hop_up = joint_hop_ups(:one)
  end

  test 'should get index' do
    get joint_hop_ups_url, as: :json
    assert_response :success
  end

  test 'should create joint_hop_up' do
    assert_difference('JointHopUp.count') do
      post joint_hop_ups_url,
           params: { joint_hop_up: { brand: @joint_hop_up.brand, compatibility: @joint_hop_up.compatibility, length: @joint_hop_up.length, material: @joint_hop_up.material, price: @joint_hop_up.price, reference: @joint_hop_up.reference, toughness: @joint_hop_up.toughness } }, as: :json
    end

    assert_response :created
  end

  test 'should show joint_hop_up' do
    get joint_hop_up_url(@joint_hop_up), as: :json
    assert_response :success
  end

  test 'should update joint_hop_up' do
    patch joint_hop_up_url(@joint_hop_up),
          params: { joint_hop_up: { brand: @joint_hop_up.brand, compatibility: @joint_hop_up.compatibility, length: @joint_hop_up.length, material: @joint_hop_up.material, price: @joint_hop_up.price, reference: @joint_hop_up.reference, toughness: @joint_hop_up.toughness } }, as: :json
    assert_response :success
  end

  test 'should destroy joint_hop_up' do
    assert_difference('JointHopUp.count', -1) do
      delete joint_hop_up_url(@joint_hop_up), as: :json
    end

    assert_response :no_content
  end
end
