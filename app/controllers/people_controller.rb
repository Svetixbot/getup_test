class PeopleController < ApplicationController
  
  def show
    @people = Person.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def filter
    @people = Person.scoped
    @people = @people.where("email like :include_email", :include_email => "%@" + params[:include_email] + "%") if !params[:include_email].blank?
    @people = @people.where("email not like :exclude_email", :exclude_email => "%@" + params[:exclude_email] + "%") if !params[:exclude_email].blank?    
    @people = @people.joins(:postcode).where("postcodes.number in (:include_postcodes)", :include_postcodes => params[:include_postcodes].to_s.split(',')) if !params[:include_postcodes].blank?    
    @people = @people.joins(:postcode).where("postcodes.number not in (:exclude_postcodes)", :exclude_postcodes => params[:exclude_postcodes].to_s.split(',')) if !params[:exclude_postcodes].blank?    
    @include_email = params[:include_email]
    @exclude_email = params[:exclude_email]
    @include_postcodes = params[:include_postcodes]
    @exclude_postcodes = params[:exclude_postcodes]
    render "show"
  end
  
  def clear
    redirect_to :action => :show
  end
  
end
