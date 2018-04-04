class Witness < ApplicationRecord
  belongs_to :promise
  belongs_to :user

  def self.link_wt_promise(witness)
    joins(:promise).where(promise: { witness: witness })
  end
end

