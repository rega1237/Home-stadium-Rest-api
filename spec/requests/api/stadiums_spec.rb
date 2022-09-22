require 'swagger_helper'

RSpec.describe 'stadiums', type: :request do
  path '/stadiums' do
    get('list staduims') do
      tags 'Stadiums'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create stadium') do
      tags 'Stadiums'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :stadium, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            country: { type: :string },
            seats: { type: :integer },
            photo: { Type: :string }
          },
          required: %w[name country seats photo]
        }
        run_test!
      end
    end
  end

  path '/stadiums/{id}' do
    # You'll want to customize the parameter types...
    get 'Show stadium' do
      tags 'Stadiums'
      produces 'application/json', 'application/xml'
      parameter name: 'id', in: :path, type: :integer
      response '200', 'stadium found' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 country: { type: :string },
                 seats: { type: :integer },
                 photo: { Type: :string }
               },
               required: %w[name country seats photo]

        let(:id) { Blog.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete('delete stadium') do
      tags 'Stadiums'
      response(200, 'successful') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end
