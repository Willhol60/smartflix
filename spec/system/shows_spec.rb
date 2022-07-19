# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The shows index page', type: :system do
  fixtures :shows

  before do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(user, scope: :user)
  end

  it 'displays all information for 10 shows by default' do
    visit '/'

    expect(page).to have_text('show10')
      .and have_text('Movie')
      .and have_content(2000)
      .and have_text('LovelyDescription')
  end

  it 'displays information for only 10 shows by default' do
    visit '/'

    expect(page).to have_text('show10')
      .and have_no_text('show11')
  end

  it('can be shortened using the limit parameter') do
    visit('/?limit=4')

    expect(page).to have_text('show4')
      .and have_no_text('show5')
  end

  it("displays 'Movie' and 'TV Show' depending on the stored integer in the model's enumerable") do
    visit '/'

    expect(page).to have_text('Movie')
      .and have_text('TV Show')
  end
end
