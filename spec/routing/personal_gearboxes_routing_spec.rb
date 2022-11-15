# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalGearboxesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'users/1/personal_gearboxes').to route_to('personal_gearboxes#index', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'users/1/personal_gearboxes/1').to route_to('personal_gearboxes#show', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'users/1/personal_gearboxes').to route_to('personal_gearboxes#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'users/1/personal_gearboxes/1').to route_to('personal_gearboxes#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/personal_gearboxes/1').to route_to('personal_gearboxes#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/personal_gearboxes/1').to route_to('personal_gearboxes#destroy', user_id: '1', id: '1')
    end
  end
end
