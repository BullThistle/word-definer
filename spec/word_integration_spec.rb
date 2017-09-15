require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Words list', {:type => :feature}) do
    it "adds an item to the list" do
      visit('/')
      fill_in('word', :with => "foo")
      click_button('Submit')
      expect(page).to have_content("foo")
    end
end