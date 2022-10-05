# frozen_string_literal: true

require 'test_helper'

class NozzlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nozzle = nozzles(:one)
  end

  test 'should get index' do
    get nozzles_url, as: :json
    assert_response :success
  end

  test 'should create nozzle' do
    assert_difference('Nozzle.count') do
      post nozzles_url,
           params: { nozzle: { brand: @nozzle.brand, for_replica: @nozzle.for_replica, length: @nozzle.length, material: @nozzle.material, o_ring: @nozzle.o_ring, price: @nozzle.price, reference: @nozzle.reference, weight: @nozzle.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show nozzle' do
    get nozzle_url(@nozzle), as: :json
    assert_response :success
  end

  test 'should update nozzle' do
    patch nozzle_url(@nozzle),
          params: { nozzle: { brand: @nozzle.brand, for_replica: @nozzle.for_replica, length: @nozzle.length, material: @nozzle.material, o_ring: @nozzle.o_ring, price: @nozzle.price, reference: @nozzle.reference, weight: @nozzle.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy nozzle' do
    assert_difference('Nozzle.count', -1) do
      delete nozzle_url(@nozzle), as: :json
    end

    assert_response :no_content
  end
end
