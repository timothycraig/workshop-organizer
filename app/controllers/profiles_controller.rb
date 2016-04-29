class ProfilesController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
    if params[:query] == ""
      flash[:alert] = "Please enter a search term."
      @profiles = Profile.order(created_at: :asc)
    elsif params[:query].present?
      get_users_and_profiles
    else
      @profiles = Profile.order(created_at: :asc)
    end
  end

  def show
    profile = Profile.find(params[:id])
    user = profile.user
    unless current_user == user
      flash[:alert] = "You do not have access to that page"
      redirect_to root_path
    else
      @profile = Profile.find(params[:id])
      @user = current_user
      @user_workshops = UserWorkshop.where(user_id: @user)
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user
    if profile.destroy && user.destroy
      flash[:success] = "Account Deleted Successfully."
    else
      flash[:alert] = "Account Not Deleted"
    end
    redirect_to root_path
  end

  def edit
    profile = Profile.find(params[:id])
    user = profile.user
    unless current_user == user
      flash[:alert] = "You do not have access to that page"
      redirect_to root_path
    else
      @profile = Profile.find(params[:id])
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Successfully edited your Profile!"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Did not manage to update profile. #{@profile.errors.full_messages.join(', ')}."
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :user_id,
      :avatar_url,
      :company,
      :biography,
      :linkedin_url,
      :twitter_url
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:alert] = "You do not have access to that page"
      redirect_to root_path
    end
  end

  def get_users_and_profiles
    @users = User.search(params[:query])
    @profiles = []
    @users.each do |user|
      @profiles << user.profile
    end
  end
end
