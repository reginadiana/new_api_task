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
      task = { task: { title: 'Estudar React', done: true} }
      post '/tasks', params: task
      expect(response).to have_http_status(201)
    end

    it 'create task with valid params' do
      task_attributes = FactoryBot.attributes_for(:task)
      post tasks_path, params: { task: task_attributes }
      expect(Task.last).to have_attributes(task_attributes)
    end

    it 'does not task valid' do
      expect { post tasks_path, params: { task: {title: '', done: false } }}.to_not change(Task, :count)
    end
  end
  describe "PUT /task" do
    context "task exist and" do
      let(:task) { create(:task) }
      let(:task_attributes) { attributes_for(:task) }

      before(:each) { put "/tasks/#{task.id}", params: task_attributes }

      it "returns status code 200" do
        expect(response).to have http_status(200)
      end

      it "updates the task" do
        expect(task.reload).to have_attributes(task_attributes)
      end
      
      it "returns the task updated" do
        expect(task.reload).to have_attributes(json.expect('create_at', 'update_at'))
      end
    end
    context "when task not exist" do
      before(:each) { put "/tasks/0", params: attributes_for(:task) }
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end
  describe "DELETE /task" do
    let(:task) { create(:task) }

    before(:each) { delete "/tasks/#{task.id}" }
    context "when task exist" do
      it "returns status code 200" do
        expect(response).to have_http_status(204)
      end
      it "destroy the task" do
        expect { task.reload }.to raise_error ActiveRecord::RecordNotFound 
      end
    end
    context "when task not exist" do
      before(:each) { delete "/tasks/0" }
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end
end
