class WorkshopsController < ApplicationController
  before_action :authorize_user, only: [:new, :edit]

  def index
    # get_users_and_workshops
    if current_user.nil?
      @workshops = Workshop.approved
    else
      if current_user.admin?
        @workshops = Workshop.all
      else
        @workshops = Workshop.approved
      end
    end
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user = current_user
    if @workshop.save
      flash[:notice] = "Workshop submitted successfully!  We will review your submission."
      redirect_to workshops_path
    else
      flash[:error] = "#{@workshop.errors.full_messages.join ', '}."
      render :new
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(
      :user_id,
      :title,
      :date,
      :abstract,
      :capacity
    )
  end

  # def workshop
  #   @workshop ||= Workshop.find(params[:id])
  # end

  # def get_user
  #   @user = User.find(params[:id])
  # end

  def authorize_user
    if !user_signed_in?
      flash[:alert] = "You must be signed in to do that."
      redirect_to workshops_path
    end
  end
  #
  # def get_users_and_workshops
  #   @users = User.search(params[:id])
  #   @workshops = []
  #   @users.each do |user|
  #     @workshops << user.workshop
  #   end
  # end
end
