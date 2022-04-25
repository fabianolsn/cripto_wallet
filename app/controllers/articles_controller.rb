class ArticlesController < ApplicationController
    def index
        @article = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        respond_to do |format|
            if @article.save
            format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
            format.json { render :show, status: :created, location: @article }
            else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    

end
