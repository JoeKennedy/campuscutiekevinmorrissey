class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to(@photo, 
                      notice: 'Photo was successfully created.') }
        format.json { render json: @photo,
                      status: created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to(@photo, 
                                  notice: 'Photo was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :remote_image_url)
  end
end
