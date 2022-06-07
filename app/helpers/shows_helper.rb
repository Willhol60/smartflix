# frozen_string_literal: true

module ShowsHelper
    def button_to_toggle_show_starred(show)
        url = show_path(show)

        options = {
            method: :put,
            remote: true,
            class: variables(show)[:style_class]
        }

        icon = content_tag(:i, nil, class: 'bi bi-star')
        icon_with_star = icon << raw(' ') << h(variables(show)[:title])
        button_to(icon_with_star, url, options)
    end

    def variables(show)
        if current_user.voted_for? show
            { 
                title: 'Starred',
                style_class: 'btn btn-warning'
            }
        else
            {
                title:'Star',
                style_class: 'btn btn-outline-warning'
            }
        end
    end
end
