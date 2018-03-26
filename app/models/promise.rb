class Promise < ApplicationRecord
  belongs_to :user, presence: true
  has_many :witnesses, presence: true
end
