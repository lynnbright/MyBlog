# frozen_string_literal: true

class ArticlesController < ApplicationController

  def index
    @articles = Article.publish.order(created_at: :desc)
  end
end
