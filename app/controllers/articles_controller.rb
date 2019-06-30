class ArticlesController < ApplicationController
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
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # raise params.inspect
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end

    # @article.update(article_params)
    # redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end
