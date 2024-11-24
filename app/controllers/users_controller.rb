class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @list_of_users = User.all.order(username: :asc)

    render({ :template => "users/index" })
  end

  def show
    username = params.fetch("path_id")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    if @the_user.followers.where({ :id => current_user.id }).at(0) != nil || @the_user.private == false || @the_user.id == current_user.id
      render({ :template => "users/show" })
    else
      redirect_to("/users", { :alert => "You're not authorized for that." })
    end
  end

  def show_liked
    username = params.fetch("path_id")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    render({ :template => "users/show_liked" })
  end
  
  def show_feed
    username = params.fetch("path_id")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    render({ :template => "users/show_feed" })
  end

  def show_discover
    username = params.fetch("path_id")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    render({ :template => "users/show_discover" })
  end
end
