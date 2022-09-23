require 'swagger_helper'

RSpec.describe 'stadiums', type: :request do
  path '/auth/login' do
    post ('User token') do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'

      parameter ({
        :in => :body,
        :type => :object,
        :name => 'username' 
      })

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 token: { type: :string },
                 username: { type: :string },
                 user_id: { type: :integer }
               },
               required: %w[username]

        run_test!
      end
    end
  end

  path '/stadiums' do
    get('list staduims') do
      tags 'Stadium'
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        security [ token: [] ]
        schema type: :object,
               properties: {
                 name: { type: :string },
                 country: { type: :string },
                 seats: { type: :integer },
                 photo: { Type: :string }
        }
        run_test!
      end
    end
  end  

  #   post('create stadium') do
  #     tags 'Stadiums'
  #     response(200, 'successful') do
  #       consumes 'application/json'
  #       parameter name: :stadium, in: :body, schema: {
  #         type: :object,
  #         properties: {
  #           name: { type: :string },
  #           country: { type: :string },
  #           seats: { type: :integer },
  #           photo: { Type: :string }
  #         },
  #         required: %w[name country seats photo]
  #       }
  #       run_test!
  #     end
  #   end
  # end

  # path '/stadiums/{id}' do
  #   get 'Show stadium' do
  #     tags 'Stadiums'
  #     produces 'application/json'
  #     consumes 'application/json'

  #     parameter name: 'id', in: :path, type: :integer
  #     security [ api_key: [] ]

  #     parameter({
  #       :in => :header,
  #       :type => :string,
  #       :name => :Authorization,
  #       :required => true,
  #       :description => 'Client token'
  #     })

  #     response '200', 'stadium found' do
  #       let(:Authorization) { 'Bearer ' + generate_token }
  #       schema type: :object,
  #              properties: {
  #                name: { type: :string },
  #                country: { type: :string },
  #                seats: { type: :integer },
  #                photo: { Type: :string },
  #              },
  #              required: %w[name country seats photo]

  #       let(:id) { Blog.create(title: 'foo', content: 'bar').id }
  #       run_test!
  #     end

  #     response '404', 'blog not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end
  #   end

  #   delete('delete stadium') do
  #     tags 'Stadiums'
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       run_test!
  #     end
  #   end
  # end
end
