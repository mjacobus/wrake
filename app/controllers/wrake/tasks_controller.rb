require_dependency "wrake/application_controller"

module Wrake
  class TasksController < ApplicationController

    before_filter :load_tasks
    before_filter :wrake_authorization

    def invoke
      Rake::Task[task_name].invoke(*args)
    end

    def wrake_authorization
      config = Wrake.config

      authenticate_or_request_with_http_basic do |username, password|
        username == config.username && password == config.password
      end
    end

    protected
      def args
        data = params[:args].presence

        if data.is_a?(String)
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
