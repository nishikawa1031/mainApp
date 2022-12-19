module ApplicationHelper
    def to_hankaku
        # Article.subjects.keys.each do |subject|
        tag.li(class: 'nav-item active', style: "font-size: 14px;") do
            link_to "民法", articles_path(subject: "civil_law"), class:"nav-link text-light" 
        end
    end
end
