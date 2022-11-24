class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    new_tweet = current_user.tweets.build(body: params["tweet"]["body"])

    if new_tweet.save
      redirect_to root_path, notice: "Tweet posted!"
    else
      message = "Tweet cannot be saved because: #{new_tweet.errors.full_messages.join(',')}"
      flash[:alert] = message
      render :new, status: 422
    end
  end
end