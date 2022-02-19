class ArticlesController < ApplicationController
  def index
    @articles = policy_scope(Article).all
    authorize @articles
  end

  def show
    @article = policy_scope(Article).find(params[:id])
    authorize @article
  end
end
