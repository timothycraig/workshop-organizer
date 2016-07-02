class Api::V1::WorkshopsController < Api::V1::BaseController
  before_action :authorize_user, only: [:new, :edit, :show]
  before_action :authorize_admin, only: [:destroy]

  def index
    if current_user.nil?
      render json: Workshop.approved
    else
      if current_user.admin?
        render json: Workshop.all
      else
        render json: Workshop.approved
      end
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
