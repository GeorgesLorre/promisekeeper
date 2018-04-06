class Promise < ApplicationRecord
  belongs_to :user
  has_many :temp_witnesses, dependent: :destroy
  has_many :witnesses, dependent: :destroy
  has_many :users, through: :witnesses
  accepts_nested_attributes_for :users
  validates :status, inclusion: {in: ["Broken", "Completed", "Pending"]}

  mount_uploader :photo, PhotoUploader

  before_validation :default_values
  after_validation :checkphoto

  def default_values
    self.status = self.status || "Pending"
  end

  def checkphoto
    if self.photo.blank?
      self.photo = open("http://res.cloudinary.com/drqpismbb/image/upload/v1522827528/dlcfbcdheok5e95saiao.png")
      self.save
    end
  end
end
