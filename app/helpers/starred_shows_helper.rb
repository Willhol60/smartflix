# frozen_string_literal: true

module StarredShowsHelper
  def button_to_toggle_show_starred(show)
      options = {
          method: variables(show)[:method],
          remote: true,
          class: variables(show)[:style_class]
      }

      icon = content_tag(:i, nil, class: 'bi bi-star')
      icon_with_star = icon << raw(' ') << h(variables(show)[:title])
      button_to(icon_with_star, variables(show)[:url], options)
  end

  def button_to_create_starred_show(show)
    options = {
      method: :post,
      remote: true,
      class: 'btn btn-outline-warning'
    }

    icon = content_tag(:i, nil, class: 'bi bi-star')
    icon_with_star = icon << raw(' ') << h('Star')
    button_to(icon_with_star, show_starred_shows_path(show), options)
  end

  def variables(show)
      if user_starred_show_ids.include?(show.id)
          {
              url: show_starred_show_path(show, find_starred_show_by_show(show)),
              method: :delete,
              title: 'Starred',
              style_class: 'btn btn-warning'
          }
      else
          {
              url: show_starred_shows_path(show),
              method: :post,
              # this post method might not be needed, post for button_to by default?
              title: 'Star',
              style_class: 'btn btn-outline-warning'
          }
      end
  end

  def user_starred_show_ids
    current_user.starred_shows.pluck(:show_id)
  end

  def find_starred_show_by_show(show)
    current_user.starred_shows.find_by(show_id: show.id)
  end
end
