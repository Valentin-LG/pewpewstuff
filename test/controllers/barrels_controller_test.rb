# frozen_string_literal: true

require 'test_helper'

class BarrelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barrel = barrels(:cybergun)
  end

  test 'should get index' do
    get barrels_url, as: :json
    assert_response :success
  end

  test 'should create barrel' do
    assert_difference('Barrel.count') do
      post barrels_url,
           params: {
             barrel: {
               brand: @barrel.brand,
               compatibility: @barrel.compatibility,
               diameter: @barrel.diameter,
               length: @barrel.length,
               material: @barrel.material,
               price: @barrel.price,
               reference: @barrel.reference
             }
           }, as: :json
    end

    assert_response :created
  end

  test 'should show barrel' do
    get barrel_url(@barrel), as: :json
    assert_response :success
  end

  test 'should update barrel' do
    patch barrel_url(@barrel),
          params: {
            barrel: {
              brand: @barrel.brand,
              compatibility: @barrel.compatibility,
              diameter: @barrel.diameter,
              length: @barrel.length,
              material: @barrel.material,
              price: @barrel.price,
              reference: @barrel.reference
            }
          }, as: :json
    assert_response :success
  end

  test 'should destroy barrel' do
    assert_difference('Barrel.count', -1) do
      delete barrel_url(@barrel), as: :json
    end

    assert_response :no_content
  end
end
