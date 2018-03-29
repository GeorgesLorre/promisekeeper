class PagesController < ApplicationController
<<<<<<< HEAD
  def home

=======
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
>>>>>>> c7c06d58fa40c86ec7c339ee4a924381b16eb869
  end
end
