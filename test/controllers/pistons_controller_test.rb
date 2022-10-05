# frozen_string_literal: true

require 'test_helper'

class PistonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piston = pistons(:one)
  end

  test 'should get index' do
    get pistons_url, as: :json
    assert_response :success
  end

  test 'should create piston' do
    assert_difference('Piston.count') do
      post pistons_url,
           params: { piston: { brand: @piston.brand, material: @piston.material, price: @piston.price, reference: @piston.reference, teeth_material: @piston.teeth_material, teeth_number: @piston.teeth_number, weight: @piston.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show piston' do
    get piston_url(@piston), as: :json
    assert_response :success
  end

  test 'should update piston' do
    patch piston_url(@piston),
          params: { piston: { brand: @piston.brand, material: @piston.material, price: @piston.price, reference: @piston.reference, teeth_material: @piston.teeth_material, teeth_number: @piston.teeth_number, weight: @piston.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy piston' do
    assert_difference('Piston.count', -1) do
      delete piston_url(@piston), as: :json
    end

    assert_response :no_content
  end
end
