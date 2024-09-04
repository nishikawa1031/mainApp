# frozen_string_literal: true

module ApplicantsHelper
  def privacy_policy
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/privacy_policy.md')))
  end

  def service_term
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(File.read(Rails.root.join('markdown/service_term.md')))
  end
end
