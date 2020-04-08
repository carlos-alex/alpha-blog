class ArticlesController  < ApplicationController

	def show
		@article= Article.find(params[:id])
	end

	def index
		@articles= Article.all
  end

	def new
		@article = Article.new
  end

	def edit
		@article= Article.find(params[:id])
	end

	def create
		@article = Article.new(params.require(:article).permit(:title,:description))
		if @article.save
				flash[:notice]= "artigo bem criado."
				redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article= Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title,:description))
			flash[:notice]= "artigo update."
			redirect_to @article
		else
			render 'edit'
		end
	end


#
#--[ Route 3 ]--------------------------------------------------------------------------------
# => Prefix | articles
# => Verb   | GET
# => URI    / /articles(.:format)
# => Controller#Action | articles#index
#
#  o redirect_to articles_path ,
#  o articles_path, vem do concat prefix mais path, da route
#  quando apago quero ir para a pagina principal
#

	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end




end
