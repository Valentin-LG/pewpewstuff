# frozen_string_literal: true

require 'test_helper'

class GearboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gearbox = gearboxes(:v3)
  end

  test 'should get index' do
    get gearboxes_url, as: :json
    assert_response :success
  end

  test 'should create gearbox' do
    assert_difference('Gearbox.count') do
      post gearboxes_url,
           params: { gearbox: { blowback: @gearbox.blowback, brand: @gearbox.brand, price: @gearbox.price, quick_detach: @gearbox.quick_detach, reference: @gearbox.reference, reinfored: @gearbox.reinfored, version: @gearbox.version } }, as: :json
    end

    assert_response :created
  end

  test 'should show gearbox' do
    get gearbox_url(@gearbox), as: :json
    assert_response :success
  end

  test 'should update gearbox' do
    patch gearbox_url(@gearbox),
          params: { gearbox: { blowback: @gearbox.blowback, brand: @gearbox.brand, price: @gearbox.price, quick_detach: @gearbox.quick_detach, reference: @gearbox.reference, reinfored: @gearbox.reinfored, version: @gearbox.version } }, as: :json
    assert_response :success
  end

  test 'should destroy gearbox' do
    assert_difference('Gearbox.count', -1) do
      delete gearbox_url(@gearbox), as: :json
    end

    assert_response :no_content
  end
end
