class Formula < ApplicationRecord
  has_many :bakes
  has_many :users, through: :bakes
  has_one :formula_author

  def author
    User.find_by(id: self.formula_author.user_id)
  end
end
