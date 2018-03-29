class PagesController < ApplicationController
  def home
  end

  def dashboard
    @promises = Promise.all
  end
end
