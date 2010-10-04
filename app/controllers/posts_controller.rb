class PostsController < ApplicationController


  filter_access_to :all
  
  respond_to :html, :rss, :xml

  
  def index
    respond_with(@posts = Post.published.order("created_at DESC"))
  
  end


  def show
    @post = Post.find(params[:id])
    @title = "RailsJam | #{@post.title}" 

  end


  def new
    @post = Post.new
    1.times { @post.attachments.build }
    respond_to do |format|
      format.html 
    end
  end


  def edit
    @post = Post.find(params[:id])
    if @post.attachments and @post.attachments.size == 0
      1.times { @post.attachments.build }      
    end
  end


  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
    end
  end
end
