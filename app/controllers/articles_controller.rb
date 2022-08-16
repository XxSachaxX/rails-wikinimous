class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :redirect, only: [:update, :create]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article.save
  end

  def show; end

  def edit; end

  def update
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def redirect
    @article.update(article_params)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
