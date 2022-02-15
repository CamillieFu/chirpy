class DashboardsController < ApplicationController
  def index
    @kids = current_user.kids.all
  end
end
