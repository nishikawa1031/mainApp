module FooterHelper

    def li_maker
        tag.ul(class: 'list-unstyled mb-0') do
            I18n.t("links").keys.each do |year|
                each_li(year)
            end
        end
    end

    private
    def each_li(year)

        concat(tag.li() do
            link_to year, root_path, class: "text-white"
        end)
    end
end
