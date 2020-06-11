require 'rails_helper'

feature 'CRUD API' do
  describe '#GET index' do
    it 'return ok status' do
      get '/tasks'

      expect(response).to have_http_status(200)
    end

    it 'return all tasks' do
      task = Task.create(title: 'Ler os artigo do OneBitCode sobre React', done: true)
      another_task = Task.create(title: 'Participar da Semana Super Full Stack (29/04 - 05/05)', done: false)

      get '/tasks'

      expect(response.content_type).to eq('application/json')
      expect(response.body).to include task.title
      expect(response.body).to include task.done

      expect(response.body).to include another_task.title
      expect(response.body).to include another_task.done
    end
  end
  describe '#PUSH create' do
    it 'return ok status' do
      task = { task: { title: 'Estudar React',
                 done: true} }

      post '/tasks', params: task

      expect(response).to have_http_status(201)
    end

    it 'create task with params' do
      task = { task: { title: 'Escrever testes no backend da aplicação',
                 done: false} }

      post '/tasks', params: task

      expect(response.content_type).to eq('application/json')
      expect(response.body).to include 'Escrever testes no backend da aplicação'
      expect(response.body).to include false
    end
  end
end
