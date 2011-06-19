class Postcodes_rule < Rule

  validates_format_of :input_value, :with => /\A((\d+,?)*|\s*)\Z/, :message => "Postcodes should be numbers separetad by commas"
  
  def filter_query
    Where_Query.new "postcodes.number in (:include_postcodes)", :include_postcodes => :input_value.split(',')
  end
    
end

class Where_Query
  attr_accessor :Query,:Query_params
  
  def init(query,query_params)
  end
end
