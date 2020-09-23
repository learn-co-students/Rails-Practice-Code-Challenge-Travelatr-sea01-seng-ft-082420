class PostsController < ApplicationController    
    before_action :set_post, only: [:show, :edit, :update, :destroy, :likes]
    def index
        @posts = Post.all
    end 
    
    def show
    end 
    
    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 
    
    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end 
        # redirect_to @post
    end 
    
    def edit
        @bloggers = Blogger.all
        @destinations = Destination.all
    end 
    
    def update    
        @post.update(post_params)
        
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end 
    end 

    def destroy
        @post.destroy
        redirect_to posts_path
    end
    
    
    def likes
        @post.update(likes: @post.likes+=1)
        redirect_to post_path(@post)
    end 
    
    private 
    
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        #params.require(:post).permit!
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 
end