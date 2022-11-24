class HomeController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def about
    @current_time = Time.now
  end
end
