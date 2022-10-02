class Admin::NewsController < ApplicationController
  before_action :authenticate_admin!
  before_action :news_choise, only: [:edit, :update, :destroy]
  def index
    @news = News.new
    @newses = News.post_pagenation(params[:page])
  end

  def create
    news = News.new(news_params)
    news.save
    redirect_to request.referer, notice: "お知らせを作成しました。"
  end

  def edit
  end

  def update
    @news.update(news_params)
    redirect_to admin_news_index_path, notice: "お知らせの内容を更新しました。"
  end

  def destroy
    @news.destroy
    redirect_to request.referer, notice: "削除しました。"
  end

  private
    def news_params
      params.require(:news).permit(:title, :content)
    end

    def news_choise
      @news = News.find(params[:id])
    end
end
