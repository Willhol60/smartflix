# frozen_string_literal: true

module ShowsHelper
    def button_to_toggle_show_starred(show)
        url = show_stars_path(show)

        # button_to_with_icon(show)

        if show.starred?
            button_to_with_icon('bi bi-star', 'Starred', url, {
                method: :delete,
                remote: true,
                class: 'btn btn-warning'
            })
        else
            button_to_with_icon('bi bi-star', 'Star', url, {
                method: :put,
                remote: true,
                class: 'btn btn-outline-warning'
            })
        end
    end
      
    def button_to_with_icon(icon_css, title, url, options = {})
        icon = content_tag(:i, nil, class: icon_css)
        icon_with_star = icon << raw(' ') << h(title)
        button_to(icon_with_star, url, options)
    end

    # def button_to_with_icon(show)

    #     # options = {
    #     #     method: :put,
    #     #     remote: true,
    #     #     show.starred ? class: 'btn btn-warning' : class: 'btn btn-outline-warning'
    #     # }

    #     icon = content_tag(:i, nil, class: icon_css)
    #     icon_with_star = icon << raw(' ') << h(title)
    #     button_to(icon_with_star, url, options)

    #     # button_to(icon_with_star, url, options)
    # end
end
