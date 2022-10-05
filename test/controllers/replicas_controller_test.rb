# frozen_string_literal: true

require 'test_helper'

class ReplicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @replica = replicas(:g36)
  end

  test 'should get index' do
    get replicas_url, as: :json
    assert_response :success
  end

  test 'should create replica' do
    assert_difference('Replica.count') do
      post replicas_url,
           params: {
             replica: {
               brand: @replica.brand,
               category: @replica.category,
               name: @replica.name,
               price: @replica.price,
               reference: @replica.reference
             }
           }, as: :json
    end

    assert_response :created
  end

  test 'should show replica' do
    get replica_url(@replica), as: :json
    assert_response :success
  end

  test 'should update replica' do
    patch replica_url(@replica),
          params: {
            replica: {
              brand: @replica.brand,
              category: @replica.category,
              name: @replica.name,
              price: @replica.price,
              reference: @replica.reference
            }
          }, as: :json
    assert_response :success
  end

  test 'should destroy replica' do
    assert_difference('Replica.count', -1) do
      delete replica_url(@replica), as: :json
    end

    assert_response :no_content
  end
end
