class WorkshopsController < ApplicationController
  before_action :authorize_user, only: [:new, :edit, :show]
  before_action :authorize_admin, only: [:destroy]

  def index
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

  def show
    get_workshop
    @user = @workshop.user
    @profile = @user.profile
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

  def edit
  end

  def update
    get_workshop
    if !@workshop.approved
      authorize_workshop
    else
      deauthorize_workshop
    end
  end

  def destroy
    get_workshop
    if current_user.admin? && @workshop.destroy
      flash[:notice] = "Workshop sucessfully deleted."
      redirect_to workshops_path
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(
      :user_id,
      :title,
      :date,
      :abstract,
      :capacity,
      :approved
    )
  end

  def get_workshop
    @workshop ||= Workshop.find(params[:id])
  end

  def authorize_workshop
    if @workshop.update_attribute(:approved, true)
      flash[:success] = "Workshop Approved: #{@workshop.title}"
    else
      flash[:error] = "Workshop Not Approved"
    end
    redirect_to workshops_path
  end

  def deauthorize_workshop
    if @workshop.update_attribute(:approved, false)
      flash[:success] = "Workshop Disapproved: #{@workshop.title}"
    else
      flash[:error] = "Workshop Not Approved"
    end
    redirect_to workshops_path
  end

  def authorize_user
    if !user_signed_in?
      flash[:alert] = "You must be signed in to do that."
      redirect_to workshops_path
    end
  end

  def authorize_admin
    if !current_user.admin?
      flash[:alert] = "You do not have access to do that."
      redirect_to workshops_path
    end
  end
end
