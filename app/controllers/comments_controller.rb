class CommentsController < ApplicationController
  def index
    @comments = @commentable.comments
    @commentable = find_commentable
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def create
   
    # @movie = Movie.find(params[:movie_id])
    # @commentable = find_commentable
    # binding.pry
    @comment = find_commentable.comments.build(comment_params)
    
    if @comment.save
      flash[:success] = "Congrats! You Added A Comment Bro."    
    else
      flash[:alert] = "No Comment for You"      
    end
    redirect_to :back
  end


  def destroy
  comment = Comment.find(params[:id])
  # @commentable = @comment.commentable
  comment.destroy
  redirect_to :back
  
  end






  private
  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  
end
