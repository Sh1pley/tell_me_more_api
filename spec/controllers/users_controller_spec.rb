require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  let(:test_token) do
    double :acceptable? => true, :scopes => [:api]
  end
  before do
    @users_list = create_list(:user, 20)
    
    allow(controller).to receive(:doorkeeper_token) { test_token }
  end

  it 'should respond with 200' do
    get :index

    expect(response).to be_success
  end

  it 'should contain specific user detail' do
    get :index

    users = response.body
    expect(users).to be_a(String)
    
    parsed_users = JSON.parse(users)
    
    expect(parsed_users.first).to have_key "id"
    expect(parsed_users.first).to have_key "name"
    expect(parsed_users.first).to have_key "email"
    expect(parsed_users.first).to have_key "password_digest"

    expect(parsed_users.first).to_not have_key "created_at"
    expect(parsed_users.first).to_not have_key "updated_at"
  end

  it 'should show specific user ' do
    user = User.first
    get :index, params: {id: user.id}

    user = response.body
    expect(user).to be_a(String)
    
    parsed_user = JSON.parse(user)
    
    expect(parsed_user.first).to have_key "id"
    expect(parsed_user.first).to have_key "name"
    expect(parsed_user.first).to have_key "email"
    expect(parsed_user.first).to have_key "password_digest"

    expect(parsed_user.first).to_not have_key "created_at"
    expect(parsed_user.first).to_not have_key "updated_at"
  end

  xit 'should respond with new item and 201 response after a post request' do
    params = {
      name: "Test",
      email: "Moartest@test.com",
      password: "12345"
    }
    post :index, params

    expect(response.status).to be(201)
    
    
    user = JSON.parse(response.body)
    expect(user).to have_key "id"
    expect(user).to have_key "name"
    expect(user).to have_key "email"

    expect(user).to have_key "password_digest"
    
    expect(user).to_not have_key "created_at"
    expect(user).to_not have_key "updated_at"
  end

  xit 'should respond with updated item and status ok' do
    db_user = @users_list.first
    params = {
      id: db_user.id,
      name: "Test Updated",
      email: "Moartest@test.com",
      password: "12345"
    }

    put :show, params: params 
    expect(response.status).to be(200)

    user = JSON.parse(response.body)

    expect(user["name"]).to eq("Test Updated")
    expect(user["email"]).to eq("Moartest@test.com")
    expect(user["password_digest"]).to_not eq("12345")
  end
end