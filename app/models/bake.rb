class Bake < ApplicationRecord
  belongs_to :user
  belongs_to :formula

  def bake_date
    self.created_at.strftime("%B %e")
  end

  def bake_build
    base = first_step
    formula = self.formula
    flour = base * 100
    water = base * formula.hydration
    salt = base * formula.salt
    starter = base * formula.starter
    preferment = formula.preferment / 100 * flour

    output = {:flour => flour.round,
              :water => water.round,
              :salt => salt.round,
              :starter => starter.round,
              :preferment => preferment.round}
    output
  end

  def levain_build
    input = self.bake_build
    output = {flour: input[:preferment],
              water: input[:preferment],
              starter: input[:starter]}
    output
  end

  def dough_build
    input = self.bake_build
    dough_flour = input[:flour] - input[:preferment]
    dough_water = input[:water] - input[:preferment]
    levain = self.levain_build
    levain_weight = levain[:flour] + levain[:water] + levain[:starter]
    output = {flour: dough_flour,
              water: dough_water,
              salt: input[:salt],
              levain: levain_weight}
    output
  end

  def first_step
    total_percentage = self.formula.hydration + 100 + self.formula.salt + self.formula.starter
    base = self.total_weight / total_percentage
    base
  end
end
