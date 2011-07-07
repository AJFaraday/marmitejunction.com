class JunctionEmbedsController < ApplicationController
 
  before_filter :require_user

  # GET /junction_embeds
  # GET /junction_embeds.xml
  def index
    @junction_embeds = JunctionEmbed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @junction_embeds }
    end
  end

  # GET /junction_embeds/1
  # GET /junction_embeds/1.xml
  def show
    @junction_embed = JunctionEmbed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @junction_embed }
    end
  end

  # GET /junction_embeds/new
  # GET /junction_embeds/new.xml
  def new
    @junction_embed = JunctionEmbed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @junction_embed }
    end
  end

  # GET /junction_embeds/1/edit
  def edit
    @junction_embed = JunctionEmbed.find(params[:id])
  end

  # POST /junction_embeds
  # POST /junction_embeds.xml
  def create
    @junction_embed = JunctionEmbed.new(params[:junction_embed])

    respond_to do |format|
      if @junction_embed.save
        format.html { redirect_to(junction_embeds_path, :notice => 'Junction embed was successfully created.') }
        format.xml  { render :xml => @junction_embed, :status => :created, :location => @junction_embed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @junction_embed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /junction_embeds/1
  # PUT /junction_embeds/1.xml
  def update
    @junction_embed = JunctionEmbed.find(params[:id])

    respond_to do |format|
      if @junction_embed.update_attributes(params[:junction_embed])
        format.html { redirect_to(@junction_embed, :notice => 'Junction embed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @junction_embed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /junction_embeds/1
  # DELETE /junction_embeds/1.xml
  def destroy
    @junction_embed = JunctionEmbed.find(params[:id])
    @junction_embed.destroy

    respond_to do |format|
      format.html { redirect_to(junction_embeds_url) }
      format.xml  { head :ok }
    end
  end
end
