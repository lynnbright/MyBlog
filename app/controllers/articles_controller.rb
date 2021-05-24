# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:edit, :update, :destroy, :show]
  before_action :find_options_for_article_status, only: [:new, :edit]

  def index
    @articles = Article.publish.recent
  end

  def new
    @article = Article.new
  end

  def show; end

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

  def destroy
    # ToDo: 改用軟刪除
    redirect_to articles_path, notice: '已成功刪除' if @article.destroy
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
    @options_for_article_status = Article.statuses.map do |key, _|
      [I18n.t(key, scope: 'enum.article.status'), key]
    end
  end
end
