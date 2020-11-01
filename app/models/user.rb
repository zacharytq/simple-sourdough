class User < ApplicationRecord
  has_many :bakes
  has_many :formula_authors
  has_many :formulas, through: :bakes
  has_secure_password
end
