class Postcodes_rule < Rule

  validates_format_of :input_value, :with => /\A((\d+,?)*|\s*)\Z/, :message => "Postcodes should be numbers separetad by commas"
    
end


