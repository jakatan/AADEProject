# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(AlumnisController, type: :routing) do
     describe 'routing' do
          before do # Skip authentication for routing
               allow_any_instance_of(Devise::Controllers::Helpers).to(receive(:authenticate_admin!).and_return(true))
          end

          it 'routes to #index' do
               expect(get: '/alumnis').to(route_to('alumnis#index'))
          end

          it 'routes to #new' do
               expect(get: '/alumnis/new').to(route_to('alumnis#new'))
          end

          it 'routes to #show' do
               expect(get: '/alumnis/1').to(route_to('alumnis#show', id: '1'))
          end

          it 'routes to #edit' do
               expect(get: '/alumnis/1/edit').to(route_to('alumnis#edit', id: '1'))
          end

          it 'routes to #create' do
               expect(post: '/alumnis').to(route_to('alumnis#create'))
          end

          it 'routes to #update via PUT' do
               expect(put: '/alumnis/1').to(route_to('alumnis#update', id: '1'))
          end

          it 'routes to #update via PATCH' do
               expect(patch: '/alumnis/1').to(route_to('alumnis#update', id: '1'))
          end

          it 'routes to #destroy' do
               expect(delete: '/alumnis/1').to(route_to('alumnis#destroy', id: '1'))
          end
     end
end
