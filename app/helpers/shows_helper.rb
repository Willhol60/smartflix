# frozen_string_literal: true
require "pry"

module ShowsHelper
    def button_to_toggle_show_starred(show)
        # title = show.starred ? 'Starred' : 'Star'
        # style_class = show.starred ? 'btn btn-warning' : 'btn btn-outline-warning'

        url = show_stars_path(show)

        # options = {
        #     method: :put,
        #     remote: true,
        #     class: style_class
        # }

        # icon = content_tag(:i, nil, class: 'bi bi-star')
        # icon_with_star = icon << raw(' ') << h(title)

        # # binding.pry

        # button_to(icon_with_star, url, options)
        
        if show.starred?
            button_to_with_icon('bi bi-star', 'Starred', url, {
                method: :put,
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
end
