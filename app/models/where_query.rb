class Where_query
  attr_accessor :query,:query_params
  
  def initialize(query,query_params)
    @query, @query_params = query, query_params 
  end
end