class PostsController < ApplicationController
    def index
        @posts=Post.all
        
    end
    
    def new
        
    end
    
    def create
        @post=Post.new
        @post.title=params[:post_title]
        @post.content=params[:post_content]
        @post.save
        
        redirect_to "/index"
    end
   
    def destroy
        @destroy_post=Post.find(params[:post_id])
        @destroy_post.destroy
        
        redirect_to '/index'
        
    end
    
    def edit
        # 이전 내용을 불러오기 위해 id를 받아와야 함
        @edit_post=Post.find(params[:post_id])
    end
    
    def update
        # 특정 글을 덮어쓰기 위해 id를 받아와야 함
        @update_post=Post.find(params[:post_id])
        @update_post.title=params[:post_title]
        @update_post.content=params[:post_content]
        @update_post.save
        
        redirect_to '/index'
    end
    
    def commentcreate
        
        comment = Comment.new
        comment.post_id = params[:post_id_for_you]
        comment.content = params[:content]
        comment.save
        
        redirect_to :back
    end
    
    def commentdestroy
        @x=Post.find(params[:post_id]).comments.find(params[:comment_id])
        @x.destroy
        
        redirect_to :back
    end
    
    def commentedit
        @edit_comment=Post.find(params[:post_id]).comments.find(params[:comment_id])
    end
    
    def commentupdate
        @update_comment=Post.find(params[:post_id]).comments.find(params[:comment_id])
        @update_comment.content=params[:comment_content]
        @update_comment.save
        
        redirect_to '/index'
    end
end
