class PeopleController < ApplicationController
  
  def show
    @people = Person.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def filter    
    # Remeber inputed paramters
    @include_postcodes = params[:include_postcodes] 
    @exclude_postcodes = params[:exclude_postcodes]
    @include_email = params[:include_email]
    @exclude_email = params[:exclude_email]
   
    # Creating rule_set of rules fo each inputed filtering parameter
    rule_set = Rule_set.new([Include_postcodes_rule.new(@include_postcodes, :include_postcodes),
    Exclude_postcodes_rule.new(@exclude_postcodes, :exclude_postcodes),
    Include_email_rule.new(@include_email, :include_email),
    Exclude_email_rule.new(@exclude_email, :exclude_email)])
            
    if rule_set.valid?
      @people = Person.filter_by_params(rule_set)
    else 
      @errors = rule_set.errors
      @people = Person.all
    end
    
    render "show"
  end
  
  def clear
    redirect_to :action => :show
  end
  
end
