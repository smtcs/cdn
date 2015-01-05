require 'spec_helper'

describe 'Home', :type => :feature do
  it 'new should 200 - /' do
    visit "/"
    page.status_code.should == 200
  end

  it 'old should 200 - /old' do
    visit '/old'
    page.status_code.should == 200
    page.should have_content 'Summit CDN'
  end
end
