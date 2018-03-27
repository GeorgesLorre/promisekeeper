class Promise < ApplicationRecord
  belongs_to :user
  has_many :witnesses, dependent: :destroy
end
