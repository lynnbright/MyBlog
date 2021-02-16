# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_options_for_article_status, only: [:new]

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

  private

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
