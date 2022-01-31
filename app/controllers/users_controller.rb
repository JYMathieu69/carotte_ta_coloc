class UsersController < ApplicationController
    def update
        @user = current_user
        token = params[:invite_token]
        @user.coloc = Coloc.find_by(invite_token: token)

        if @user.save && @user.coloc
          if !@user.coloc.assignment_day
            OnboardingChannel.broadcast_to(
              @user.coloc,
              {
                user: current_user,
                avatar_key: current_user.avatar.key
              }
            )
          end
          
          redirect_to ongoing_tasks_path
        else
          render "colocs/join"
        end
    end
end
