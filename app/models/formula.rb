class Formula < ApplicationRecord
  has_many :bakes
  has_many :users, through: :bakes
  has_one :formula_author
  validates :name, presence: true
  validates :hydration, presence: true
  validates :salt, presence: true
  validates :starter, presence: true
  validates :preferment, presence: true

  def author_name
    user = User.find(self.author)
    user.name
  end
  
end
