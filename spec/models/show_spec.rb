# frozen_string_literal: true

require "rails_helper"
require_relative "../../app/models/show"

RSpec.describe(Show, :type => :model) do

  it "new Show objects must conform to not-null constraints - valid example" do
    show = Show.new(:show_type => 0, :title => "x", :release_year => 2000)

    expect(show.save).to(be_truthy)
  end

  it "without type" do
    show_fail = Show.new(:title => "x", :release_year => 2000)

    expect(show_fail.valid?).to(eq(false))
  end

  it "without title" do
    show_fail = Show.new(:show_type => 0, :release_year => 2000)

    expect(show_fail.valid?).to(eq(false))
  end

  it "without release year" do
    show_fail = Show.new(:show_type => 0, :title => "x")
    
    expect(show_fail.valid?).to(eq(false))
  end

  it "has a method, star!, which changes the starred attribute from false to true" do
    show = Show.new(:show_type => 0, :title => "x", :release_year => 2000)

    expect{ show.star! }.to change(show, :starred).from(false).to(true)
  end

  it "has a method, unstar!, which changes the starred attribute from true to false" do
    show = Show.new(:show_type => 0, :title => "x", :release_year => 2000, :starred => true)

    expect{ show.unstar! }.to change(show, :starred).from(true).to(false)
  end
end
