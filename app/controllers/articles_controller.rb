# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_options_for_article_status, only: [:new]

  def index
    @articles = Article.publish.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  private

  def find_options_for_article_status
    # TODO: _ use i18n to show select-text
    @options_for_article_status = Article.statuses.map do |key, _|
      [_, key]
    end
  end
end
