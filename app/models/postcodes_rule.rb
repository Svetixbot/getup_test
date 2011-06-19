class Postcodes_rule < Rule

  validates_format_of :input_value, :with => /\A((\d+,?)*|\s*)\Z/, :message => "Postcodes should be numbers separetad by commas"
  
  #def filter_query
  #  "postcodes.number in (:include_postcodes)", :include_postcodes => :input_value.split(',')
  #end
    
end