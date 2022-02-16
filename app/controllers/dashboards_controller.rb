class DashboardsController < ApplicationController
  def index
    @kids = policy_scope(Kid).order(created_at: :desc)
    @kids = current_user.kids.all
    authorize @kids
  end
end
