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
    @promises = Promise.all
  end
end
