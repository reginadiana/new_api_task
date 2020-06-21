require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get tasks_path
      expect(response).to have_http_status(200)
    end

    it 'return all tasks' do
      another_task = Task.create(title: 'Participar da Semana Super Full Stack (29/04 - 05/05)', done: false)
      task = Task.create(title: 'Ler os artigo do OneBitCode sobre React', done: true)
      task_attributes = FactoryBot.attributes_for(:task)
      get '/tasks'

      expect(Task.last).to have_attributes(task_attributes)
      expect(task.done).to eq true
      expect(response.body).to include task.title
      expect(response.body).to include another_task.title
      expect(another_task.done).to eq false
    end
  end
  describe 'PUSH /tasks' do
    it 'return ok status' do
      task = { task: { title: 'Estudar React',
                 done: true} }
      post '/tasks', params: task
      expect(response).to have_http_status(201)
    end

    it 'create task with valid params' do
      task_attributes = FactoryBot.attributes_for(:task)
      post tasks_path, params: { task: task_attributes }
      expect(Task.last).to have_attributes(task_attributes)
    end

    it 'does not task valid' do
      expect { post tasks_path, params: { task: {title: '', done: false} }}.to_not change(Task, :count)
    end
  end
  describe "PUT /task" do
    it "returns status code 200" do
      task = create(:task)
      task_attributes = attributes_for(:task)
      put "/tasks/#{task.id}", params: task_attributes
      expect(response).to have http_status(200)
    end

    it "updates the task" do
      task = create(:task)
      task_attributes = attributes_for(:task)
      put "/tasks/#{task.id}", params: task_attributes
      expect(task.reload).to have_attributes(task_attributes)
    end
    
    it "returns the task updated" do
      task = create(:task)
      task_attributes = attributes_for(:task)
      put "/tasks/#{task.id}", params: task_attributes

      json_response = JSON.parse(response.body)
      expect(task.reload).to have_attributes(json_response.expect('create_at', 'update_at'))
    end
    it "when task not exist returns status code 404" do
      put "/tasks/0", params: attributes_for(:task)
      expect(response).to have_http_status(404)
    end
    it "returns a not found message" do
      put '/tasks/0', params: attributes_for(:task)
      expect(response.body).to match(/Couldn't find Task/)
    end
  end
  describe "DELETE /task" do
    it "returns status code 200" do
      task = create(:task)
      delete "/tasks/#{task.id}"
      expect(response).to have_http_status(204)
    end
    it "destroy the task" do
      task = create(:task)
      delete "/tasks/#{task.id}"
      expect { task.reload }.to raise_error ActiveRecord::RecordNotFound 
    end
    it "returns status code 204 when task not exist" do
      delete "/tasks/0"
      expect(response).to have_http_status(204)
    end
    it "returns a not found message when task not exist" do
      delete '/tasks/0'
      expect(response.body).to match(/Couldn't find Task/)
    end
  end
end
