module API
    module V1
        class Tasks < Grape::API
            include API::V1::Defaults
            resource :tasks do
                desc "Return all tasks"
                get "" do
                    Task.all
                end
                desc "Return a task"
                params do
                    requires :id, type: String, desc: "ID of the task"
                end
                get ":id" do
                    Task.where(id: permitted_params[:id]).first!
                end
            end
        end
    end
end