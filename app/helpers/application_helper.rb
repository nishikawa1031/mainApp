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
            undlerline = "
                border-bottom:solid;
                border-color:#FFFF00;
                border-width:5px;
            " if params[:subject] == subject

            concat(tag.li(class: 'nav-item active', style: "font-size: 14px;") do
                link_to I18n.t("article.subject.#{subject.to_s}"), articles_path(subject: "#{subject}"), class:"nav-link text-light" , style: undlerline
            end)
        end
end
