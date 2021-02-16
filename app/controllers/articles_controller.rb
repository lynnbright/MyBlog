# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]
  before_action :find_options_for_article_status, only: [:new, :edit]

  def index
    @articles = Article.publish.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to edit_article_path(@article), notice: '更新成功'
    else
      render :edit
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title,
      :content,
      :status
    )
  end

  def find_options_for_article_status
    # TODO: _ use i18n to show select-text
    @options_for_article_status = Article.statuses.map do |key, _|
      [_, key]
    end
  end
end
