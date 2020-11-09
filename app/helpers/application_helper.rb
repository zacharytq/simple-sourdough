module ApplicationHelper
  
  def formula_id_field(bake)
    if bake.formula.nil?
      select_tag "bake[:formula_id]", options_from_collection_for_select(Formula.all, :id, :name)
    else
      hidden_field_tag "bake[:formula_id]", bake.formula_id
    end
  end

  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end

end
