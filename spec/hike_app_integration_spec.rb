require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the region path", {:type => :feature}) do
  it("lets the user select a region to find a list of hikes") do
    visit("/")
    click_link("Urban Sprawl")
    expect(page).to have_content("All Hikes in")
  end
end

describe("the random hike generator path", {:type => :feature}) do
  it("lets the user select be suggested a random hike") do
    visit("/")
    click_link("Random hike")
    expect(page).to have_content('Current Weather')
  end
end
