require_dependency "wrake/application_controller"
# require Rails.root.join('Rakefile')

module Wrake
  class TasksController < ApplicationController
    before_filter :load_tasks

    def invoke
      Rake::Task[task_name].invoke(*args)
    end

    private
      def args
        data = params[:args].presence

        if data.respond_to?(:split)
          data = data.split(' ')
        end

        data
      end

      def task_name
        params[:task_name]
      end

      def load_tasks
        Rails.application.load_tasks
      end
  end
end
