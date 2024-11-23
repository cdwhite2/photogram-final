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

    render({ :template => "users/show" })
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
