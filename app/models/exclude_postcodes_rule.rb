class Exclude_postcodes_rule < Postcodes_rule
  
  def filter_query
    Where_query.new "postcodes.number not in (:exclude_postcodes)", :exclude_postcodes => @input_value.to_s.split(',')
  end
    
end