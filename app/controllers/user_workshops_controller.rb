class UserWorkshopsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:user_workshop][:workshop_id])
    @workshop.user = current_user
    @attendees = UserWorkshop.where(workshop: @workshop)
    current_attendees
    sign_up
  end

  def sign_up
    if @current_attendees.include?(current_user.id)
      flash[:alert] = "You have already signed up for #{@workshop.title}"
      redirect_to workshops_path
    elsif @current_attendees.length >= @workshop.capacity
      flash[:alert] = "#{@workshop.title} is full!"
      redirect_to workshops_path
    else
      flash[:success] = "Sucessfully signed up for #{@workshop.title}"
      UserWorkshop.create(signup_params)
      redirect_to workshops_path
    end
  end

  def current_attendees
    @current_attendees = []
    @attendees.each do |attendee|
      @current_attendees << attendee.user_id
    end
  end

  private

  def signup_params
    params.require(:user_workshop).permit(
      :user_id,
      :workshop_id
    )
  end
end
