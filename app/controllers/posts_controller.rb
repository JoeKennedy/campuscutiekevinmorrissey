class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  def index
    @category = params[:category]
    if !@category or @category == 'all'
      @posts = Post.order('created_at DESC')
    elsif @category == 'mine' and user_signed_in?
      @posts = current_user.posts.order('created_at DESC')
    else
      @category = @category.split(' ').map(&:capitalize).join(' ')
      @posts = Post.where(:category => @category).order('created_at DESC')
    end
    
    @current_page = params[:page]
    @posts = @posts.page(@current_page)
    if !@current_page
      @current_page = 1
    elsif
      @current_page = @current_page.to_i
    end
    @total_pages = @posts.num_pages

    @is_index = true;

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def create
    @post = current_user.posts.create(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, 
                      :notice => 'Post was successfully created.') }
        format.json { render :json => @post,
                      :status => created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @is_index = false;

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
   
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, 
                                  :notice => 'Post was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, 
                                       :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
