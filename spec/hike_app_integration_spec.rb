require "spec_helper"

describe("the region path", {:type => :feature}) do
  it("lets the user select a region to find a list of hikes") do
    visit("/")
    click_link("Willamette Valley")
    expect(page).to have_content("All Hikes in Willamette Valley")
  end
end

describe("the region to hike path", {:type => :feature}) do
  it("lets the user select a region to select a specific hike from") do
    # Hike.create({name: "Council Crest Hike", latitude: "45.529641", longitude: "-122.700726", region: "Portland Area"})
    # visit("/")
    # click_link("Portland")
    # click_link("Council Crest Hike")
    # expect(page).to have_content('About Council Crest Hike')
  end
end

describe("the random hike generator path", {:type => :feature}) do
  # it("lets the user select be suggested a random hike") do
  #   visit("/")
  #   click_link("Random hike")
  #   expect(page).to have_content('4 Day Forecast')
  end
end

describe("the search preferences path", {:type => :feature}) do
  it("lets the user select their preferences to find matching hikes") do
    visit("/")
    click_link("Search")
    expect(page).to have_content('Enter criteria to search Hikes')
  end
end

describe("the search preferences path", {:type => :feature}) do
  it("lets the user select their preferences to find matching hikes") do
    visit("/")
    click_link("Features")
    expect(page).to have_content('Features')
  end
end

describe("the search preferences path", {:type => :feature}) do
  it("lets the user select their preferences to find matching hikes") do
    visit("/")
    click_link("Features")
    expect(page).to have_content('Features')
  end
end
