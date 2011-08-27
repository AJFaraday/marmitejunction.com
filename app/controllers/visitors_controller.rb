class VisitorsController < ApplicationController

  def index
    if current_user
      @main_visitors = Visitor.all
    else 
      @main_visitors = Visitor.where :reported => false 
    end
  end

  def create
    @visitor = Visitor.new(params[:visitor])
    if @visitor.save
      session[:gb_errors] = nil
      session[:gb_message] = nil
      flash[:notice] = "Thank you for making your addition to the Marmite Junction visitors book."
      redirect_to visitors_path
    else
      flash[:notice] = "Something's wrong, try again?"
      session[:gb_errors] = @visitor.errors
      session[:gb_message] = @visitor.attributes
      redirect_to '/#bookform'
    end
  end

  def unreport
    @visitor = Visitor.find params[:id]
    @visitor.update_attribute :reported, false
    flash[:notice] = "You've unreported that particular entry in the guestbook."
    redirect_to visitors_path
  end 

end
