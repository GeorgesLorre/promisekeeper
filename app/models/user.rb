class User < ApplicationRecord
  has_many :promises, dependent: :destroy

  has_many :witnesses
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  after_create :user_is_witness

  def user_is_witness
    checker = TempWitness.all.select{|w| self.name == w.fullname}.first
    if !checker.nil? && self.facebook_friends.map{|f| f["id"]}.include?(checker.promise.user.uid)
      wi = Witness.new
      wi.user = self
      wi.promise = checker.promise
      wi.save!
      checker.destroy
    end
  end

  def facebook_friends
    holder = []
    fb_friends = Koala::Facebook::API.new(token).get_connections("me", "friends")
    while !fb_friends.nil?
      holder << fb_friends
      holder.flatten!
      fb_friends = fb_friends.next_page
    end
    holder
  end

  def facebook_taggable_friends
    holder = []
    fb_friends = Koala::Facebook::API.new(token).get_connections("me", "taggable_friends")
    while !fb_friends.nil?
      holder << fb_friends
      holder.flatten!
      fb_friends = fb_friends.next_page
    end
    holder
  end

  def self.witness_is_user(test)
    User.all.select{|u| u.name == test}
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name, :name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    return user
  end
end
