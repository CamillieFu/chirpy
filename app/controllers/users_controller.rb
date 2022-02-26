class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:first_name, :last_name, :tag_list) ## Rails 4 strong params usage
  end
  # this was the documentation but not sure how it will play with devise
end

# @user.tag_list.add("awesome")   # add a single tag. alias for <<
# @user.tag_list.remove("awesome") # remove a single tag
# @user.save # save to persist tag_list
