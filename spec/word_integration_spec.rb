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

    it 'clicks link to see word page' do
        visit('/')
        fill_in('word', :with => "apple")
        click_button('Submit')
        click_link('apple')
        expect(page).to have_content("apple")
        expect(page).to have_content("Back to list")
      end
end
