require 'rails_helper'

RSpec.describe Task, type: :model do
	it('create a new task with sucess') do
		title = FFaker::Name.first_name
		done = %i[true false].sample

		task = Task.new(title: title, done: done)
		expect(task).to be_valid
	end

	it('task cannot be blank') do
		done = %i[true false].sample

		task = Task.new(title: " ", done: done)
		expect(task).to_not be_valid
	end
end
