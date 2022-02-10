class UsersController < ApplicationController
  before_action :set_user
    def update
      if @user.update(user_params)
        redirect_to edit_user_path(@user)
      else 
        render :edit
      end
    end
    
    def edit; end
    
    def join_coloc
      token = params[:invite_token].strip
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
        redirect_to join_coloc_path, notice: "Veuillez entrer un code valide"
      end
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username, :avatar)
    end
end
