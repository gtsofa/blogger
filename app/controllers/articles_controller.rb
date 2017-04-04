class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])

  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' has been successful created!"
  redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    #data: {confirm: "Really delete the article?"}
    @article.destroy
    flash.notice = "Article '#{@article.title}' has been successful deleted!"
    redirect_to article_path
  end
  def edit
  @article = Article.find(params[:id])

end
def update
  @article = Article.find(params[:id])
  @article.update(article_params)

  flash.notice = "Article '#{@article.title}' has been successful updated!"
  redirect_to article_path(@article)
end

end
