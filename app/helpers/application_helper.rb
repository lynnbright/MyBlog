# frozen_string_literal: true

module ApplicationHelper
  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
      prettify: true,
      link_attributes: {
        rel: 'nofollow noopener',
        target: '_blank'
       }
    }

    markdown_options = {
      autolink: true,
      fenced_code_blocks: true,
      highlight: true,
      no_intra_emphasis: true,
      strikethrough: true,
      space_after_headers: true,
      superscript: true
    }

    rendered =  SyntaxHighlightHtml.new(render_options)
    markdown = Redcarpet::Markdown.new(rendered, markdown_options)
    markdown.render(text).html_safe
  end
end
