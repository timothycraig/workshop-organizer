class HomeController < ApplicationController
  def page_not_found
  end

  def show
    if request.accept =~ /json/
      head :forbidden
      return
    end
  end
end
