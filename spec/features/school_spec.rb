require 'spec_helper'

describe 'School routes', :type => :feature do
  describe 'hashquery', :type => :feature do
    it 'js should 200 - /hq.js' do
      visit '/cs/hq.js'
      page.status_code.should == 200
    end
  end
end
