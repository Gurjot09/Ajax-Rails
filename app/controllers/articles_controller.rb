class ArticlesController < ApplicationController

	def index
		@article = Article.new
		@articles = Article.all
	end


	def create
		@article = Article.new(valid_params)
		if @article.save
			respond_to do |format|
				format.js
			end
		end
	end



	def destroy
		@article = Article.find(params[:id])
  		@article.destroy
  		redirect_to articles_path
	end

	 def edit
    	debugger
    	@article = Article.find(params[:id])
  		
  	end

	def update
	    @article = Article.find(params[:id])
	 	if @article.update(valid_params)
	      redirect_to articles_path
	    else
	      render 'edit'
	    end
    end


	private
	def valid_params
		params.require(:article).permit(:title, :content)
		
	end


end
