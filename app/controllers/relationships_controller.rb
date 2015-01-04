class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    if current_user
      current_user.follow(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      redirect_to login_url
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    if current_user
      current_user.unfollow(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      redirect_to login_url
    end
  end

end