# frozen_string_literal: true

module FooterHelper
  def li_maker(linkname)
    tag.ul(class: 'list-unstyled mb-0') do
      I18n.t('links').each_key do |year|
        link_path = I18n.t("links.#{year}.#{linkname}")

        concat(tag.li do
          link_to year, link_path, class: 'text-white'
        end)
      end
    end
  end
end
