class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @products  = current_user.products.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end
end
