class FormulaAuthor < ApplicationRecord
  belongs_to :formula
  belongs_to :user
end
