class UsersController < ApplicationController
    def update
        @user = current_user
        token = params[:invite_token]
        @user.coloc = Coloc.find_by(invite_token: token)

        if @user.save! && @user.coloc
            redirect_to ongoing_tasks_path
        else
            render "colocs/join"
        end
    end
end
