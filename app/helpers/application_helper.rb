module ApplicationHelper
    def ul_sub_header
        tag.ul(class: 'navbar-nav mr-auto pl-2') do
            Article.subjects.keys.each do |subject|
                li_html(subject)
            end
        end
    end

    private
        def li_html(subject)
            concat(tag.li(class: 'nav-item active', style: "font-size: 14px;") do
                link_to "#{subject}", articles_path(subject: "#{subject}"), class:"nav-link text-light" 
            end)
        end
end
