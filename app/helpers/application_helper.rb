# frozen_string_literal: true

module ApplicationHelper
  def render_markdown(text)
    return '' if text.nil?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end

  private

  def current_user?(user)
    user == current_user
  end
end
