class User < ApplicationRecord
  has_many :bakes
  has_many :formula_authors
  has_many :formulas, through: :bakes
  has_secure_password
  validates :name, presence: true
  

  def my_formula_ids
    self.formula_authors.collect { |f| f.formula_id }
  end

  def my_formulas
    self.my_formula_ids.collect { |f| Formula.find(id: f) }
  end
end
