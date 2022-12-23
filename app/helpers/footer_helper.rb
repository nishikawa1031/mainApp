module FooterHelper
    def li_maker
        link_name = "R4司法試験問題"

        tag.li() do
            link_to link_name, root_path, class: "text-white"
        end
    end
end
