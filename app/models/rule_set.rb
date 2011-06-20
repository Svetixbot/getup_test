class Rule_set
  attr_accessor :rules
  
  def initialize(rules)
    @rules = rules 
  end
  
  def errors
    errors = Hash.new
    @rules.each do |rule|
      if !rule.valid?
          errors[rule.input_name] = rule.errors.to_s
      end
    end
  
    return errors
  end
  
  def valid?
     @rules.each do |rule|
        if !rule.valid?
            return false
        end
      end
      return true
  end
  
end