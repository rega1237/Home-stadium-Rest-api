shared_context 'request_context' do
  let!(:user) { User.order(:id).first }
  let!(:stadium) { Stadium.order(:id).first }
  let!(:game) { Game.order(:id).first }
  let!(:team_one) { Team.order(:id).first }
  let!(:team_two) { Team.order(:id).last }
  let!(:reservation) { Reservation.order(:id).first }

  before(:all) do
    GameTeam.destroy_all
    Team.destroy_all
    Game.destroy_all
    Stadium.destroy_all
    Reservation.destroy_all
    User.destroy_all
    Rails.application.load_seed
  end

  before(:each) do
    post auth_login_path, headers: { 'Content-Type': 'application/json' }, params: { username: user.username }.to_json
    @token = JSON.parse(response.body)['token']
  end
end
