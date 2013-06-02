class LinksController < ApplicationController
  load_and_authorize_resource

  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @links }
    end
  end

  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @link }
    end
  end

  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link, 
                      :notice => 'Link was successfully created.') }
        format.json { render :json => @link,
                      :status => created, :location => @link }
      else
        format.html { render :action => "new" }
        format.json { render :json => @link.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @link }
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
   
    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to(@link, 
                                  :notice => 'Link was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @link.errors, 
                                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end
  
end
