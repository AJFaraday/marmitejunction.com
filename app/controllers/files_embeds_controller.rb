class FilesEmbedsController < ApplicationController

  before_filter :require_user

  # GET /files_embeds
  # GET /files_embeds.xml
  def index
    @files_embeds = FilesEmbed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @files_embeds }
    end
  end

  # GET /files_embeds/1
  # GET /files_embeds/1.xml
  def show
    @files_embed = FilesEmbed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @files_embed }
    end
  end

  # GET /files_embeds/new
  # GET /files_embeds/new.xml
  def new
    @files_embed = FilesEmbed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @files_embed }
    end
  end

  # GET /files_embeds/1/edit
  def edit
    @files_embed = FilesEmbed.find(params[:id])
  end

  # POST /files_embeds
  # POST /files_embeds.xml
  def create
    @files_embed = FilesEmbed.new(params[:files_embed])

    respond_to do |format|
      if @files_embed.save
        format.html { redirect_to(files_embeds_path, :notice => 'Files embed was successfully created.') }
        format.xml  { render :xml => @files_embed, :status => :created, :location => @files_embed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @files_embed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /files_embeds/1
  # PUT /files_embeds/1.xml
  def update
    @files_embed = FilesEmbed.find(params[:id])

    respond_to do |format|
      if @files_embed.update_attributes(params[:files_embed])
        format.html { redirect_to(@files_embed, :notice => 'Files embed was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @files_embed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /files_embeds/1
  # DELETE /files_embeds/1.xml
  def destroy
    @files_embed = FilesEmbed.find(params[:id])
    @files_embed.destroy

    respond_to do |format|
      format.html { redirect_to(files_embeds_url) }
      format.xml  { head :ok }
    end
  end
end
