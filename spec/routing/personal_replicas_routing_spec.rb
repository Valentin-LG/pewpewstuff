# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalReplicasController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'users/1/personal_replicas').to route_to('personal_replicas#index', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'users/1/personal_replicas/1').to route_to('personal_replicas#show', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'users/1/personal_replicas').to route_to('personal_replicas#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'users/1/personal_replicas/1').to route_to('personal_replicas#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/personal_replicas/1').to route_to('personal_replicas#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/personal_replicas/1').to route_to('personal_replicas#destroy', user_id: '1', id: '1')
    end
  end
end
