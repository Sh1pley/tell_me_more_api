require 'rails_helper'

RSpec.describe '/api/v1/users' do
  before do
    @users_list = create_list(:user, 20)
  end

  it 'should respond with 200' do
    get "/api/v1/users"

    expect(response).to be_success
  end

  it 'should contain specific users' do
    get '/api/v1/users'

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

  it 'should respond with new item and 201 response after a post request' do
    params = {
      name: "Test",
      email: "Moartest@test.com",
      password: "12345"
    }
    post "/api/v1/users", params

    expect(response.status).to be(201)
    
    user = JSON.parse(response.body)

    expect(user).to have_key "id"
    expect(user).to have_key "name"
    expect(user).to have_key "email"

    expect(user).to have_key "password_digest"
    
    expect(user).to_not have_key "created_at"
    expect(user).to_not have_key "updated_at"
  end

  it 'should respond with updated item and status ok' do
    params = {
      name: "Test Updated",
      email: "Moartest@test.com",
      password: "12345"
    }
    db_user = @users_list.first

    put "/api/v1/users/#{db_user.id}", params
    expect(response.status).to be(200)

    user = JSON.parse(response.body)

    expect(user["name"]).to eq("Test Updated")
    expect(user["email"]).to eq("Moartest@test.com")
    expect(user["password_digest"]).to_not eq("12345")
  end
end