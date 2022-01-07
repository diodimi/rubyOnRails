
require "rails_helper"


  options = {
    :window_size => [1920, 1080]
  }
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, options)
  end


RSpec.feature "Visit single post", :type => :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario "User goes to a single post from the home page", js: true do
    post
    visit root_path
    

    page.find(".single-post-card").click

    expect(page).to have_selector('body .modal',visible: false)


    page.find('.interested a',visible: false).trigger("click")
    
    expect(page).to have_selector('.single-post-card p',visible:false, text: post.content)
  end

end