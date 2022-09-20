require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Warden::Test::Helpers

  before :each do
    @user = User.create(
      username: 'username',
    )

    login_as(@user, scope: :user)
  end

  describe 'User created' do
    it 'should return a success response' do
      get group_expenses_path(@group)
      expect(response).to be_successful
    end

    it 'should return a 200 response' do
      get group_expenses_path(@group)
      expect(response).to have_http_status '200'
    end

    it 'should return a list of expenses' do
      get group_expenses_path(@group)
      expect(response.body).to include @expense.name
    end
  end
end
