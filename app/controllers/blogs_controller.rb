class BlogsController < ApplicationController
    before_action :set_blog, only:[:show, :like_index, :like_show]
    before_action :add_like, only:[:like_index, :like_show]

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new
      @blog.body = params[:body]
      @blog.save
      redirect_to blogs_path
    end

    def show
      @replies = @blog.replies.order(created_at: :desc)
    end

    def index
      @blogs = Blog.all.order(created_at: :desc)
    end

    def like_index
      redirect_to blogs_path
    end

    def like_show
      redirect_to blog_path(@blog.id)
    end

    private

    def blog_params
      params.require(:blog).permit(:body)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def add_like
      @blog.like += 1
      @blog.save
    end

end
