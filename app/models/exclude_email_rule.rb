class Exclude_email_rule < Email_rule
  
  def filter_query
    Where_query.new "email not like :exclude_email", :exclude_email => "%@#{input_value}%"
  end
    
end