class Person < ActiveRecord::Base
  belongs_to :postcode
  
  def to_s
    id.to_s + name.to_s + postcode_id.to_s + email.to_s
  end
  
end
