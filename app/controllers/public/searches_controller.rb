class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @keyword = params[:keyword]
    @post = Post.search(@keyword).publish
  end
end
