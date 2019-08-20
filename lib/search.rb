
class Search
  
  def add_inputs(entity, attribute, value)
    @entity = entity
    @attribute = attribute
    @value = value
  end
  
  def add_results(results)
    if entity == nil then raise "undefined entity parameter" end
    if attribute == nil then raise "undefined attribute parameter" end
    if value == nil then raise "undefined value parameter" end
    @results = results
  end
  
  def entity
    @entity
  end
  
  def attribute
    @attribute
  end
  
  def value
    @value
  end
  
  def results
    @results
  end
end
