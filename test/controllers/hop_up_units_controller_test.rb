# frozen_string_literal: true

require 'test_helper'

class HopUpUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hop_up_unit = hop_up_units(:one)
  end

  test 'should get index' do
    get hop_up_units_url, as: :json
    assert_response :success
  end

  test 'should create hop_up_unit' do
    assert_difference('HopUpUnit.count') do
      post hop_up_units_url,
           params: { hop_up_unit: { brand: @hop_up_unit.brand, for_replica: @hop_up_unit.for_replica, material: @hop_up_unit.material, price: @hop_up_unit.price, reference: @hop_up_unit.reference, weight: @hop_up_unit.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show hop_up_unit' do
    get hop_up_unit_url(@hop_up_unit), as: :json
    assert_response :success
  end

  test 'should update hop_up_unit' do
    patch hop_up_unit_url(@hop_up_unit),
          params: { hop_up_unit: { brand: @hop_up_unit.brand, for_replica: @hop_up_unit.for_replica, material: @hop_up_unit.material, price: @hop_up_unit.price, reference: @hop_up_unit.reference, weight: @hop_up_unit.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy hop_up_unit' do
    assert_difference('HopUpUnit.count', -1) do
      delete hop_up_unit_url(@hop_up_unit), as: :json
    end

    assert_response :no_content
  end
end
