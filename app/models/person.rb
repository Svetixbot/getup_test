class Person < ActiveRecord::Base
  belongs_to :postcode
  
  def to_s
    id.to_s + name.to_s + postcode_id.to_s + email.to_s
  end

  def self.filter_by_params(rule_set)
    people = Person.scoped.joins(:postcode)
    
  	rule_set.rules.each do |rule|
	    if !rule.input_value.blank?
        people = people.where(rule.filter_query.query, rule.filter_query.query_params)
      end
	  end

    return people
  end
end
