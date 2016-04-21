class ProfilesController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
    @profiles = Profile.order(created_at: :asc)
  end

  def show
    profile = Profile.find(params[:id])
    user = profile.user
    unless current_user == user
      flash[:alert] = "You do not have access to that page"
      redirect_to root_path
    else
      @profile = Profile.find(params[:id])
      @user = @profile.user
    end
  end

  def destroy
    profile = Profile.find(params[:id])
    user = profile.user
    # reviews = user.reviews

    if profile.destroy && user.destroy
      # reviews.each { |review| review.destroy }
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
      :biography
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:alert] = "You do not have access to that page"
      redirect_to root_path
    end
  end
end
