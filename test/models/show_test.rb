# frozen_string_literal: true

require 'test_helper'
require_relative '../../app/models/show'

class ShowTest < ActiveSupport::TestCase
  test 'new Show objects must conform to not-null constraints - valid example' do
    show = Show.new({ show_type: 0, title: 'x', release_year: 2000 })

    assert show.save
  end

  test 'without type' do
    show_fail = Show.new({ title: 'x', release_year: 2000 })

    refute show_fail.valid?, 'show_fail object invalid due to no type being provided'
  end

  test 'without title' do
    show_fail = Show.new({ show_type: 0, release_year: 2000 })

    refute show_fail.valid?, 'show_fail object invalid due to no title being provided'
  end

  test 'without release year' do
    show_fail = Show.new({ show_type: 0, title: 'x' })

    refute show_fail.valid?, 'show_fail object invalid due to no release year being provided'
  end
end
