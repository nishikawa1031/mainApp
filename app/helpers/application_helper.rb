module ApplicationHelper
    def ul_sub_header
        tag.ul(class: 'navbar-nav mr-auto pl-2') do
            Article.subjects.keys.each do |subject|
                li_html(subject)
            end
        end
    end

    private
        def current_user?(user)
            user == current_user
        end

        def li_html(subject)
            undlerline = "
                border-bottom:solid;
                border-color:#F0A500;
                border-width:5px;
            " if params[:subject] == subject

            # TODO:記事が十分集まったら削除する
            no_article = Article.where(subject: subject).empty?
            classname = no_article ? "nav-link text-muted" : "nav-link text-light" ;

            concat(tag.li(class: 'nav-item active', style: "font-size: 14px;") do
                link_to I18n.t("article.subject.#{subject.to_s}"), articles_path(subject: "#{subject}"), class: classname, style: undlerline
            end)
        end
end
