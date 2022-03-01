class DashboardsController < ApplicationController
  def index
    @kids = policy_scope(Kid).order(created_at: :desc)
    @kids = current_user.kids.all
    authorize @kids
    @kid = Kid.new
    @articles = policy_scope(Article).order(created_at: :desc)
    authorize @articles
  end
end
