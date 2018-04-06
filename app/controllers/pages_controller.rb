class PagesController < ApplicationController
  # def home
  #   @graph = Koala::Facebook::API.new(User.last.token)
  #   @profile = @graph.get_object("me")
  #   @friends = @graph.get_connections("me", "friends")
  #   raise
  # end

  def home
    @promise = Promise.new
  end

  def privacy
    render 'pages/privacy_policy'
  end

  def dashboard
    @mypromises = current_user.promises.sort_by(&:created_at)
    @mypromises.reverse!
  end
end
