class ProfilesController < ApplicationController
  def show
    @user = User.find(params["id"])
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params["id"])

    if @user.id == current_user.id
      @user.screenname = params["user"]["screenname"]
      if @user.save
        redirect_to profile_path(id: @user.id), notice: "User profile saved!"
      else
        message = "User profile cannot be saved because: #{@user.errors.full_messages.join(',')}"
        flash[:alert] = message
        render :edit, status: 422
      end
    end
  end
end
