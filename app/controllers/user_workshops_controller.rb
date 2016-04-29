class UserWorkshopsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:user_workshop][:workshop_id])
    # @user = current_user
    # @user = @workshop.user
    @workshop.user = current_user
    UserWorkshop.create(signup_params)
    flash[:success] = "Sucessfully signed up for: #{@workshop.title}"
    redirect_to workshops_path
  end

  private

  def signup_params
    params.require(:user_workshop).permit(
      :user_id,
      :workshop_id
    )
  end
end
