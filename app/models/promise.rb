class Promise < ApplicationRecord
  belongs_to :user
  has_many :temp_witnesses, dependent: :destroy
  has_many :witnesses, dependent: :destroy
  has_many :users, through: :witnesses
  accepts_nested_attributes_for :users
end
