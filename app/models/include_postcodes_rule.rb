class Include_postcodes_rule < Postcodes_rule
  
  def filter_query
    Where_query.new "postcodes.number in (:include_postcodes)", :include_postcodes => @input_value.to_s.split(',')
  end
    
end


