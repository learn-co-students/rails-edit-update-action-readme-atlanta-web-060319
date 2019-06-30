class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # render new_article_path(@article.id)
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

   #edit existing article - "here's the thing to edit"
  def edit 
    @article = Article.find(params[:id])
    # redirect_to edit_article_path(@article.id)
  end 

  #actually do the editing once its comes back
  def update 
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    # @article.update_attributes(article_params)
    # raise params.inspect
    redirect_to article_path(@article)
  end 


  private 
  def article_params 
    params.require(:article).permit(:title, :description)
  end

  # def edit
  #   @article = Article.find(params[:id])
  # end
   
  # def update
  #   raise params.inspect
  # end

  
end
