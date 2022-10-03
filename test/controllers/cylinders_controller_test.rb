require "test_helper"

class CylindersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cylinder = cylinders(:one)
  end

  test "should get index" do
    get cylinders_url, as: :json
    assert_response :success
  end

  test "should create cylinder" do
    assert_difference("Cylinder.count") do
      post cylinders_url, params: { cylinder: { brand: @cylinder.brand, diameter: @cylinder.diameter, drilled: @cylinder.drilled, material: @cylinder.material, price: @cylinder.price, reference: @cylinder.reference, size: @cylinder.size, weigh: @cylinder.weigh } }, as: :json
    end

    assert_response :created
  end

  test "should show cylinder" do
    get cylinder_url(@cylinder), as: :json
    assert_response :success
  end

  test "should update cylinder" do
    patch cylinder_url(@cylinder), params: { cylinder: { brand: @cylinder.brand, diameter: @cylinder.diameter, drilled: @cylinder.drilled, material: @cylinder.material, price: @cylinder.price, reference: @cylinder.reference, size: @cylinder.size, weigh: @cylinder.weigh } }, as: :json
    assert_response :success
  end

  test "should destroy cylinder" do
    assert_difference("Cylinder.count", -1) do
      delete cylinder_url(@cylinder), as: :json
    end

    assert_response :no_content
  end
end
