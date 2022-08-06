class Public::SearchesController < ApplicationController
  def search
    if (params[:keyword])[0] == '#'
      @post = Tag.search(params[:keyword]).order('created_at DESC')
    else
      @post = Post.search(params[:keyword]).order('created_at DESC')
    end
  end
end
