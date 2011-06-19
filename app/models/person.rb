class Person < ActiveRecord::Base
  belongs_to :postcode
  
  def to_s
    id.to_s + name.to_s + postcode_id.to_s + email.to_s
  end

  def self.filter_by_params(params)
    people = Person.scoped
    people = people.joins(:postcode).where("email like :include_email", :include_email => "%@" + params[:include_email] + "%") if !params[:include_email].blank?
    people = people.joins(:postcode).where("email not like :exclude_email", :exclude_email => "%@" + params[:exclude_email] + "%") if !params[:exclude_email].blank?    
    people = people.joins(:postcode).where("postcodes.number in (:include_postcodes)", :include_postcodes => params[:include_postcodes].to_s.tr(" ","").split(',')) if !params[:include_postcodes].blank?    
    people = people.joins(:postcode).where("postcodes.number not in (:exclude_postcodes)", :exclude_postcodes => params[:exclude_postcodes].to_s.tr(" ","").split(',')) if !params[:exclude_postcodes].blank?    
    return people
  end
end
