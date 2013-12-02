class InfoController < ApplicationController
  def about
  end

  def browse
  	 if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all.order(created_at: :desc)
    end
  end

  def contribute
  end
end
