class PeopleController < ApplicationController
  def show
    @people = Person.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  def filter
    @people = Person.all(:conditions => ["email like (?) and ", '%@'+params[:include_email]+'%'])
    @include_email = params[:include_email]
    render "show"
  end
  
  def clear
    redirect_to :action => :show
  end
end
