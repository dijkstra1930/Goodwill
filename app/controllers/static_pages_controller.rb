class StaticPagesController < ApplicationController
  def home
      @feed_items = Product.all.paginate(page: params[:page])
  end

  def about
  end
end
