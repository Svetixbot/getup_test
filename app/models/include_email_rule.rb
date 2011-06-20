class Include_email_rule < Email_rule
  
  def filter_query
    Where_query.new "email like :include_email", :include_email => "%@#{input_value}%"
  end
    
end