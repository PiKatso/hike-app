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

describe("the region to hike path", {:type => :feature}) do
  it("lets the user select a region to select a specific hike from") do
    visit("/")
    click_link("Urban Sprawl")
    click_link("Chicken Creek Loop Hike")
    expect(page).to have_content('4 Day Forecast')
  end
end

describe("the random hike generator path", {:type => :feature}) do
  it("lets the user select be suggested a random hike") do
    visit("/")
    click_link("Random hike")
    expect(page).to have_content('Current Weather')
  end
end

describe("the search preferences path", {:type => :feature}) do
  it("lets the user select their preferences to find matching hikes") do
    visit("/")
    click_link("Search")
    expect(page).to have_content('Which features are you looking for?')
  end
end

describe("the search preferences path", {:type => :feature}) do
  it("lets the user select their preferences to find matching hikes") do
    visit("/")
    click_link("Features")
    expect(page).to have_content('Features')
  end
end
