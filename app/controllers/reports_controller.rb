class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.xml
  def index
    require_user
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
#  def show
#    @report = Report.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @report }
#    end
#  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    @visitor = Visitor.find params[:visitor_id]
    @report = Report.new(session[:rep_message].merge({:visitor_id => params[:visitor_id]}))
    @rep_errors = session[:rep_errors]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
#  def edit
#    @report = Report.find(params[:id])
#  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Report.new(params[:report])

    if @report.save
      @report.visitor.update_attribute :reported, true
      session[:rep_errors] = nil
      session[:rep_message] = nil
      flash[:notice] = "You've reported that entry in the guest book. It won't be displayed until we've reviewed your complaint, and never again if we sustain the complaint."
      redirect_to "/"
    else
      session[:rep_errors] = @report.errors
      session[:rep_message] = @report.attributes
      redirect_to :action => "new", :visitor_id => @report.visitor_id
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
#  def update
#    @report = Report.find(params[:id])
#
#    respond_to do |format|
#      if @report.update_attributes(params[:report])
#        format.html { redirect_to(@report, :notice => 'Report was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    require_user
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
end
