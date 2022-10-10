# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/items', type: :request do
  path '/items' do
    get 'Retrieves all items' do
      tags 'Items'
      # security [basic_auth: []]
      produces 'application/json', 'application/xml'

      response '200', 'item found' do
        schema type: :array, items: { properties: { id: { type: :integer }, user_id: { type: :integer }, part_id: { type: :integer }, part_type: { type: :string }, comment: { type: :text, nullable: true }
        }
        }

        run_test!
      end
    end

    path '/items/{id}' do
      get 'Retrieves a item' do
        tags 'Items'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'item found' do
          schema type: :object, properties: { id: { type: :integer }, user_id: { type: :integer }, part_id: { type: :integer }, part_type: { type: :string }, comment: { type: :text, nullable: true }
          }

          user = User.first
          part = Barrel.create(reference: 'cybergun')
          let(:id) { Item.create(user_id: user.id, part_id: part.id, part_type: part.class).id }
          run_test!
        end

        response '404', 'item not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a item' do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: { type: :object, properties: { user_id: { type: :integer }, part_id: { type: :integer }, part_type: { type: :string }, comment: { type: :text, nullable: true }
      }, required: %w[user_id part_id part_type]
      }

      # response '201', 'item created' do
      #   let(:user) { User.create(email: 'test@test.com') }
      #   let(:item) { { user_id: user.id, part_id: Barrel.first.id, part_type: 'Barrel' } }
      #   run_test!
      # end

      response '422', 'invalid request' do
        let(:item) { { part_id: Barrel.first.id } }
        run_test!
      end

      # TODO: Create TU for part_id: Nozzle.id; part_type: 'Barrel'
    end
  end
end
