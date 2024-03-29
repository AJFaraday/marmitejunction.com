class VisitorsController < ApplicationController

  before_filter :require_user, :only => [:unreport, :mass_delete]

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
      flash[:notice] = "I can't let that into the guest book because:<br/>#{@visitor.errors.full_messages.join('<br/>')}"
      #session[:gb_errors] = @visitor.errors
      session[:gb_message] = @visitor.attributes
      redirect_to '/#bookform'
      FailedVisit.increment
    end
  end

  def unreport
    @visitor = Visitor.find params[:id]
    @visitor.update_attribute :reported, false
    flash[:notice] = "You've unreported that particular entry in the guestbook."
    redirect_to visitors_path
  end 

  def mass_delete
    if params[:commit]
      visitors = []
      params.keys.each do |key|
        puts key
        if key.to_s.include? "visitor_"
          visitors << Visitor.find(key.to_s.gsub('visitor_','').to_i)
        end
      end
      flash[:notice] = "#{visitors.count} visitor book entries have been culled."
      visitors.each{|v| v.destroy}
      redirect_to visitors_url
    end 
  end

end
