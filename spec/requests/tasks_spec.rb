require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
    # initialize test data
    let!(:tasks) { created_list(:task, 10) }
    let!(:task_id) { tasks.first.id }

    # Test suite for GET /tasks endpoint
    describe 'GET /tasks' do
        # make HTTP get request before each example
        before { get 'tasks' }

        it 'returns tasks' do
            #'json' is a custom helper to parse JSON responses 
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Test suite for GET /tasks/:id endpoint
    describe 'GET /tasks/:id' do
        before { get "/tasks/#{tasks_id}" }

        context 'when the record exists' do
            it 'returns the task' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(task_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:task_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Task/)
            end
        end
    end

    # Test suite for POST /tasks endpoint
    describe 'POST /tasks' do
        # verify payload
        let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

        context 'when the request is valid' do
            before { post '/tasks', params: valid_attributes }
      
            it 'creates a task' do
              expect(json['title']).to eq('Learn Elm')
            end
      
            it 'returns status code 201' do
              expect(response).to have_http_status(201)
            end
          end
      
        context 'when the request is invalid' do
            before { post '/tasks', params: { title: 'Foobar' } }
        
            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        
            it 'returns a validation failure message' do
                expect(response.body)
                .to match(/Validation failed: Created by can't be blank/)
            end
        end
    end

    # Test suite for PUT /tasks/:id endpoint 
    describe 'PUT /tasks/:id' do
        let(:valid_attributes) { { title: 'Shopping' } }

        context 'when the record exists' do
            before { put "/tasks/#{todo_id}", params: valid_attributes }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    # Test suite for DELETE /todos/:id
    describe 'DELETE /tasks/:id' do
        before { delete "/tasks/#{todo_id}" }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
