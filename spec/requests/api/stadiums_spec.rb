require 'swagger_helper'

RSpec.describe 'stadiums', type: :request do
  # ----- Documentation to get user token ----- #
  path '/auth/login' do
    post('User token') do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'

      parameter({
                  in: :body,
                  type: :object,
                  name: 'username'
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

  # ----- Documentation to Reservations ----- #
  path '/users/{id}/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [token: []]
      consumes 'application/json'
      produces 'application/json'

      response '200', 'Reservations' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 country: { type: :string },
                 seats: { type: :integer },
                 photo: { Type: :string },
                 coming_games: { type: :array,
                                 items: { type: :object,
                                          properties: {
                                            game_id: { type: :integer },
                                            teams: { type: :array,
                                                     items: { type: :object,
                                                              properties: {
                                                                name: { type: :string },
                                                                flag: { type: :string }
                                                              } } },
                                            date: { type: :string },
                                            available_seats: { type: :integer }
                                          } } }
               }
        run_test!
      end
    end

    post('Create reservation') do
      tags 'Reservations'
      security [token: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reserved_seats: { type: :integer },
          game_id: { type: :integer }
        },
        required: %w[name country seats photo]
      }

      response(200, 'successful') do
        parameter name: :reservation, in: :body, eschema: {
          type: :object,
          properties: {
            reserved_seats: { type: :integer },
            game_id: { type: :integer }
          },
          required: %w[reserved-seats game_id]
        }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    get('Show reservation') do
      tags 'Reservations'
      security [token: []]

      parameter in: :path, type: :integer, name: 'id'

      response(200, 'successful') do
        run_test!
      end
    end

    delete('Show reservation') do
      tags 'Reservations'
      security [token: []]

      parameter in: :path, type: :integer, name: 'id'

      response(200, 'successful') do
        run_test!
      end
    end
  end

  # ----- Documentation to Stadiums ----- #
  path '/stadiums' do
    get('list staduims') do
      tags 'Stadiums'
      security [token: []]
      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
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

    post('create stadium') do
      tags 'Stadiums'
      security [token: []]
      consumes 'application/json'
      produces 'application/json'

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

      response(200, 'successful') do
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
    get 'Show stadium' do
      tags 'Stadiums'
      security [token: []]
      produces 'application/json'

      parameter name: 'id', in: :path, type: :integer

      response '200', 'stadium found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 country: { type: :string },
                 seats: { type: :integer },
                 photo: { Type: :string },
                 coming_games: { type: :array,
                                 items: { type: :object,
                                          properties: {
                                            game_id: { type: :integer },
                                            teams: { type: :array,
                                                     items: { type: :object,
                                                              properties: {
                                                                name: { type: :string },
                                                                flag: { type: :string }
                                                              } } },
                                            date: { type: :string },
                                            available_seats: { type: :integer }
                                          } } }
               }
        run_test!
      end

      response '404', 'Stadium Not FOUND' do
        run_test!
      end
    end

    delete('delete stadium') do
      tags 'Stadiums'
      security [token: []]

      parameter name: 'id', in: :path, type: :integer

      response(200, 'successful') do
        run_test!
      end
    end
  end

  # ----- Documentation to Games ----- #
  path '/stadiums/{id}/games/' do
    post('Create Game') do
      tags 'Games'
      security [token: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: 'id', in: :path, type: :integer
      parameter name: :game, in: :body, schema: {
        type: :object,
        properties: {
          game: { type: :object,
                  properties: {
                    date: { type: :string },
                    team_one: { type: :integer },
                    team_two: { type: :integer }
                  } }
        },
        required: %w[date]
      }

      response(200, 'successful') do
        parameter name: :game, in: :body, schema: {
          type: :object,
          properties: {
            date: { type: :string },
            team_one: { type: :integer },
            team_two: { type: :integer }
          },
          required: %w[name country seats photo]
        }
        run_test!
      end
    end
  end

  path '/stadiums/{stadium_id}/games/{id}' do
    get 'Show Game' do
      tags 'Games'
      security [token: []]
      produces 'application/json'

      parameter in: :path, type: :integer, name: 'stadium_id'
      parameter in: :path, type: :integer, name: 'id'

      response(200, 'successful') do
        run_test!
      end
    end

    delete 'Delete Game' do
      tags 'Games'
      security [token: []]
      produces 'application/json'

      parameter in: :path, type: :integer, name: 'stadium_id'
      parameter in: :path, type: :integer, name: 'id'

      response(200, 'successful') do
        run_test!
      end
    end
  end

  # ----- Documentation to Teams ----- #
  path '/teams' do
    get('List of teams') do
      tags 'Teams'
      security [token: []]
      produces 'application/json'

      response(200, 'successful') do
        parameter name: :team, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            flag: { type: :string }
          },
          required: %w[name flag]
        }
        run_test!
      end
    end
  end
end
