require 'rails_helper'

describe 'Students Api', type: :request do
  it 'returns all students' do
	get '/api/v1/students'

	expect(response).to have_http_status(:success)
	expect(JSON.parse(response.body).size).to eq(0)
  end
end