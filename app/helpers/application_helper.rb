# frozen_string_literal: true

module ApplicationHelper
  def render_markdown(text)
    return '' if text.nil?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text).html_safe
  end

  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/privacy_policy.md')))
  end

  def service_term
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/service_term.md')))
  end

  def internship
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/internship.md')))
  end

  def about
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/about.md')))
  end

  def contact
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/contact.md')))
  end

  private

  def current_user?(user)
    user == current_user
  end
end
