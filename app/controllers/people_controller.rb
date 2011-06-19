class PeopleController < ApplicationController
  
  def show
    @people = Person.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def filter    
    #Remeber inputed paramters
    @include_postcodes = params[:include_postcodes] 
    @exclude_postcodes = params[:exclude_postcodes]
    @include_email = params[:include_email]
    @exclude_email = params[:exclude_email]
   
    #Creating rules for each filtering parameter for validation
    rules = [Postcodes_rule.new(@include_postcodes, :include_postcodes),
    Postcodes_rule.new(@exclude_postcodes, :exclude_postcodes),
    Email_rule.new(@include_email, :include_email),
    Email_rule.new(@exclude_email, :exclude_email)]
    
    rules.each do |r|
      if !r.valid?
          @error = r.errors
      end
    end
    
    if @error.blank?
      @people = Person.filter_by_params(params)
    else 
      @people = Person.all
    end
    
    render "show"
  end
  
  def clear
    redirect_to :action => :show
  end
  
end
