require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get tasks_path
      expect(response).to have_http_status(200)
    end

    it 'return all tasks' do
      task = Task.create(title: 'Ler os artigo do OneBitCode sobre React', done: true)
      another_task = Task.create(title: 'Participar da Semana Super Full Stack (29/04 - 05/05)', done: false)

      get '/tasks'

      #expect(Task.last).to have_attibutes(task)
      #expect(response.body).to include task.done
      expect(response.body).to include task.title

      expect(response.body).to include another_task.title
      #expect(response.body).to include another_task.done
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
      task = { task: { title: 'Escrever testes no backend da aplicação',
                 done: false} }

      post '/tasks', params: task

      expect(response.body).to include 'Escrever testes no backend da aplicação'
      #expect(response.body).to include false
    end
  end
end
