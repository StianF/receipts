class StartPagesController < ApplicationController
  def index
    if current_user
      @start_pages = StartPage.all
    else
      redirect_to login_path
    end
  end
end
