class UsersController < ApplicationController
  def index
    @list_of_users = User.all

    render({ :template => "users/index" })
  end
end
