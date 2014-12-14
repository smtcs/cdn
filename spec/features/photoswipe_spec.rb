require_relative '../spec_helper'

describe 'Photoswipe routes', :type => :feature do
  it 'css should 200' do
    visit '/ps/ps.css'
    page.status_code.should == 200
  end

  it 'js should 200' do
    visit '/ps/ps.js'
    page.status_code.should == 200
  end

  it 'ui should 200' do
    visit '/ps/ps-ui.js'
    page.status_code.should == 200
  end

  describe 'skin', :type => :feature do
    it 'css should 200' do
      visit '/ps/skin/skin.css'
      page.status_code.should == 200
    end

    it 'png should 200' do
      visit '/ps/skin/skin.png'
      page.status_code.should == 200
    end

    it 'svg should 200' do
      visit '/ps/skin/skin.svg'
      page.status_code.should == 200
    end

    it 'preloader should 200' do
      visit '/ps/skin/preloader.gif'
      page.status_code.should == 200
    end
  end
end
