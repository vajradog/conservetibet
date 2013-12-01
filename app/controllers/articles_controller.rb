class ArticlesController < ApplicationController
  before_filter :authenticate, only: [:edit, :new, :update, :destroy]


  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
        @article = Article.find(params[:id])

  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "Created article."
    else
      render :new
    end
  end


  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Updated article."
    else
      render :edit
    end

  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to browse_path
    else
      redirect_to @article
      
    end
  end
    protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|

    username == "foo" && password == "bar"
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:teacher, :recorded, :sound, :image, :title, :content)
    end
end
