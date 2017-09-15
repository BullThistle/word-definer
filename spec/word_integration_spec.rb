require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'Words list', {:type => :feature} do
    it "adds an item to the list" do
      visit '/'
      fill_in 'word', :with => "foo"
      click_button 'Submit'
      expect(page).to have_content "foo"
    end

    it 'clicks link to see word page' do
        visit '/'
        fill_in 'word', :with => "apple"
        click_button 'Submit'
        click_link 'apple'
        expect(page).to have_content "apple"
        expect(page).to have_content "Back to list"
    end

    it 'clicks link to add word and definition' do
        visit '/'
        fill_in 'word', :with => "banana"
        fill_in 'definition', :with => "A yellow fruit."
        click_button 'Submit'
        click_link 'banana'
        expect(page).to have_content "banana"
        expect(page).to have_content "A yellow fruit."
    end

    it 'enters in a duplicate word' do
        visit '/'
        fill_in 'word', :with => "orange"
        fill_in 'definition', :with => "An orange fruit."
        click_button 'Submit'
        fill_in 'word', :with => "orange"
        fill_in 'definition', :with => "A round orange fruit."
        click_button 'Submit'
        expect(page).to have_content "This is a duplicate word"
    end

end
