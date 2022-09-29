class Admin::NewsController < ApplicationController
  def index
    @news = News.new
    @newses = News.all
  end

  def create
    news = News.new(news_params)
    news.save
    redirect_to request.referer, notice: "お知らせを作成しました。"
  end

  def edit
  end

  private
    def news_params
      params.require(:news).permit(:title, :content)
    end
end
