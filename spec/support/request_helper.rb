# frozen_string_literal: true

module Requests
  module JsonHelpers
    def response_json
      JSON.parse(response.body)
    end

    def title
      Faker::Lorem.sentence
    end

    def done
      Faker::Boolean.boolean
    end

    def create_task
      Task.create(title: title, done: done)
    end

    def params_task
      { task: { title: title, done: done } }
    end
  end
end
