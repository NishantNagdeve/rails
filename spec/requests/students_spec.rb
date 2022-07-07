require 'rails_helper'

describe 'Students Api', type: :request do
  it 'returns all students' do
  	FactoryBot.create(:student, name: 'Nishant', email: 'nishant@gmail.com', roll_no: '11', school: 'ABC')
  	FactoryBot.create(:student, name: 'Lokesh', email: 'lokesh@gmail.com', roll_no: '10', school: 'XYZ')
  	FactoryBot.create(:student, name: 'Sam', email: 'sam@gmail.com', roll_no: '13', school: 'XYZ')

	get '/api/v1/students'

	expect(response).to have_http_status(:success)
	expect(JSON.parse(response.body).size).to eq(3)
  end
end