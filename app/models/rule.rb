class Rule
  include ActiveModel::Validations

  attr_accessor :input_value, :input_name
  
  def initialize(input_value, input_name)
    @input_value, @input_name = input_value, input_name 
  end
  
end