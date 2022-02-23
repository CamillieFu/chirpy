class ArticlesController < ApplicationController
  def index
    @query = params[:query]
    @articles = policy_scope(Article).order(created_at: :desc)
    if params[:query].present?
      @articles = Article.search_by_title_content_and_author(params[:query])
    else
      @article = Article.all
    end
    authorize @articles

    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { articles: @articles } }
    end
  end

  def show
    @article = policy_scope(Article).find(params[:id])
    authorize @article
  end
end
