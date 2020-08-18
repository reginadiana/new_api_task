require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "request successfully" do
      get tasks_path
      expect(response).to have_http_status(:ok)
    end

    it 'return all tasks' do
      task = create_task
      another_task = create_task
      get tasks_path

      expect(response_json[0]['title']).to eq task.title
      expect(response_json[0]['done']).to eq task.done
      expect(response_json[1]['title']).to eq another_task.title
      expect(response_json[1]['done']).to eq another_task.done
    end
  end
  describe 'PUSH /tasks' do
    it 'return ok status' do
      task = { task: { title: 'Estudar React', done: true } }
      post tasks_path, params: task
      expect(response).to have_http_status(:created)
    end

    it 'create task with valid params' do
      task_attributes = FactoryBot.attributes_for(:task)
      post tasks_path, params: { task: task_attributes }
    
      expect(response_json['title']).to eq task_attributes[:title]
      expect(response_json['done'].to_s).to eq task_attributes[:done].to_s
    end

    it 'does not task valid' do
      expect { post tasks_path, params: { task: {title: '', done: false } }}.to_not change(Task, :count)
    end
  end
  describe "PUT /task" do
    context "task exist and" do
      let(:task) { create(:task) }
      let(:task_attributes) { attributes_for(:task) }
      
      before(:each) do 
        task_params = { task: task_attributes }
        put "/tasks/#{task.id}", params: task_params
      end

      it "returns status code 200" do
        expect(response).to have_http_status(:ok)
      end

      it "updates the task" do
        expect(task.reload.title).to eq task_attributes[:title]
        expect(task.reload.done.to_s).to eq task_attributes[:done].to_s
      end
    end
    context "when task not exist" do
      before(:each) { put "/tasks/0", params: attributes_for(:task) }
      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
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
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end
      it "destroy the task" do
        expect { task.reload }.to raise_error ActiveRecord::RecordNotFound 
      end
    end

    context "when task not exist" do
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
