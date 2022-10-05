# frozen_string_literal: true

require 'test_helper'

class SpringGuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spring_guide = spring_guides(:atm)
  end

  test 'should get index' do
    get spring_guides_url, as: :json
    assert_response :success
  end

  test 'should create spring_guide' do
    assert_difference('SpringGuide.count') do
      post spring_guides_url,
           params: { spring_guide: { brand: @spring_guide.brand, length: @spring_guide.length, on_bearing: @spring_guide.on_bearing, price: @spring_guide.price, quick_detach: @spring_guide.quick_detach, reference: @spring_guide.reference, weight: @spring_guide.weight } }, as: :json
    end

    assert_response :created
  end

  test 'should show spring_guide' do
    get spring_guide_url(@spring_guide), as: :json
    assert_response :success
  end

  test 'should update spring_guide' do
    patch spring_guide_url(@spring_guide),
          params: { spring_guide: { brand: @spring_guide.brand, length: @spring_guide.length, on_bearing: @spring_guide.on_bearing, price: @spring_guide.price, quick_detach: @spring_guide.quick_detach, reference: @spring_guide.reference, weight: @spring_guide.weight } }, as: :json
    assert_response :success
  end

  test 'should destroy spring_guide' do
    assert_difference('SpringGuide.count', -1) do
      delete spring_guide_url(@spring_guide), as: :json
    end

    assert_response :no_content
  end
end
