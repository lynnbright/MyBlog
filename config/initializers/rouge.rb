# frozen_string_literal: true

require 'rouge/plugins/redcarpet'

class SyntaxHighlightHtml < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
