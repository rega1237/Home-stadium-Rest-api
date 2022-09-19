require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.destroy_all
    @first_user = User.create(username: 'username')
  end

  it 'Valid with all attributes' do
    expect(@first_user).to be_valid
  end

  it 'needs a name' do
    @first_user.username = nil
    expect(@first_user).to_not be_valid
  end
end
