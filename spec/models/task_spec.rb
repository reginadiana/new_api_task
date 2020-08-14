require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'create a new task' do
    let(:done) { %i[true false].sample }

    it('with sucess') do
      title = Faker::Lorem.sentence
      task = Task.new(title: title, done: done)

      expect(task).to be_valid
    end

    it('and must be blank') do
      task = Task.new(title: '', done: done)
      expect(task).to_not be_valid
    end
  end
end
