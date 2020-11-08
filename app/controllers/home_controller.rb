class HomeController < ApplicationController
  def index
    @categories = Category.all.by_date
  end
end
