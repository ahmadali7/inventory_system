class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :create]
  def index
  	product = Product.find(params[:id])
    @comments = product.comments
    respond_to do |format|
      format.html # index.html.erb

      format.xml  { render :xml => @comments }
    end
  end

  def show
  	respond_to do |format|
  		format.html # show.html.erb
	    format.xml  { render :xml => @comment }
	  end  
	end

	def new
		respond_to do |format|
      format.html # new.html.erb

      format.xml  { render :xml => @comment }
    end
  end

  def edit
  end

  def create
  	product = Product.find(params[:product_id])
    @comment = product.comments.create!(comment_params.merge(user: current_user))
   # comment = Comment.create(params[:comment].permit!)
   # respond_to do |format|
   # format.js {}
   # end
  end

  def update
    respond_to do |format|
      if @comment.update_attributes(comment_params)

        format.html { redirect_to([@comment.product, @comment], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  	@comment.destroy
  	respond_to do |format|
  		format.html { redirect_to(product_comments_url) }
  		format.xml  { head :ok }
	  end
	end

	private

  def comment_params
    params.permit(:content, :product_id)
  end


  def set_comment
    product = Product.find(params[:product_id])
    @comment = product.comments.find(params[:id])
  end

end
