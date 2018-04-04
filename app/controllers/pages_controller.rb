class PagesController < ApplicationController
  # def home
  #   @graph = Koala::Facebook::API.new(User.last.token)
  #   @profile = @graph.get_object("me")
  #   @friends = @graph.get_connections("me", "friends")
  #   raise
  # end
  #
  def privacy
    render 'pages/privacy_policy'
  end

  def dashboard
    @mypromises = current_user.promises
  end

  def friends
   @witness = Witness.link_wt_promise(current_user)
  end
end
