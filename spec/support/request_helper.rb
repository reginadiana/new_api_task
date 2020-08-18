module Requests
  module JsonHelpers
    def response_json
      JSON.parse(response.body)
    end

    def title
      Faker::Lorem.sentence
    end

    def done
      %i[true false].sample
    end

    def create_task
      Task.create(title: title, done: done)
    end

    def params_task
      { task: { title: title, done: done } }
    end
  end
end
