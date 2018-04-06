require 'json'

class PromisesController < ApplicationController
  before_action :set_promise, only: [ :show, :edit, :update, :destroy]

  def index
    @promises = Promise.all
    @promise = Promise.new
    @user = current_user
    @taggable_friends = user_signed_in? ? current_user.facebook_friends : []
  end

  def show
  end

  def new
  end

  def create
    @promise = Promise.new(promise_params)
    @promise.user = current_user



    tagged_friends = params[:promise][:temp_witnesses]

    if !tagged_friends.nil?
      if @promise.save!
        holder = @promise.user.facebook_friends.select{ |x| tagged_friends.include?(x["name"]) }

        holder.each do |friend|
            wi = Witness.new
            wi.user = User.find_by(name: friend["name"])

            wi.promise = @promise
            wi.save!
        end
        # PromiseMailer.creation_confirmation(@promise).deliver_now
        redirect_to promise_path(@promise)
        link = Koala::Facebook::API.new(current_user.token)
        tags = []
        @promise.temp_witnesses.each{|w| tags << w.encoded_fb_id}
        @promise.witnesses.each{|w| tags << w.user.uid}
        link.put_connections("me", "feed", link: "https://promise-keeper.herokuapp.com/promises/#{@promise.id}" , tags: tags.join(','))
      else
        if @promise.errors.any?
          flash[:alert] = @promise.errors
        end
      end
    else
      flash[:alert] = "Please tag witnesses"
      @promises = Promise.all
      @promise = Promise.new
      @user = current_user
      @taggable_friends = user_signed_in? ? current_user.facebook_taggable_friends : []
      render :index
    end
  end

  def edit
  end

  def update
    @promise.update(promise_params)
    redirect_to friends_path
  end

  def destroy
    @service.destroy
  end

  private

  def set_promise
    @promise = Promise.find(params[:id])
  end

  def promise_params
    params.require(:promise).permit(:title, :description, :deadline, :photo, :status)
  end

  def temp_witness_fields(i)
    {fullname: i["name"],encoded_fb_id: i["id"], pic_url: i["picture"]["data"]["url"] }
  end

end
