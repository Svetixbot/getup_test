class Postcode < ActiveRecord::Base
  has_many :people
  
  def to_s
    id.to_s + number.to_s + suburb.to_s
  end
  
end
