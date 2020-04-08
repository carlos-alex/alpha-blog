class ArticlesController  < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	#before_action :article_params, only: [:create, :update]

	def show
		set_article
	end

	def index
		@articles= Article.all
  end

	def new
		@article = Article.new
  end

	def edit
		set_article
	end

	def create
		@article = Article.new(article_params)
		if @article.save
				flash[:notice]= "artigo bem criado."
				redirect_to @article
		else
			render 'new'
		end
	end

	def update
		set_article
		if @article.update(article_params)
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
		set_article
		@article.destroy
		redirect_to articles_path
	end

	private

 	def set_article
		@article= Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title,:description)
	end

end
