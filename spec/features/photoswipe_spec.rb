require_relative '../spec_helper'

describe 'Photoswipe routes', :type => :feature do
  it 'css should 200 - /ps/ps.css' do
    visit '/ps/ps.css'
    page.status_code.should == 200
  end

  it 'js should 200 - /ps/ps.js' do
    visit '/ps/ps.js'
    page.status_code.should == 200
  end

  it 'ui should 200 - /ps/ps-ui.js' do
    visit '/ps/ps-ui.js'
    page.status_code.should == 200
  end

  describe 'skin', :type => :feature do
    it 'css should 200 - /ps/skin/skin.css' do
      visit '/ps/skin/skin.css'
      page.status_code.should == 200
    end

    it 'png should 200 - /ps/skin/skin.png' do
      visit '/ps/skin/skin.png'
      page.status_code.should == 200
    end

    it 'svg should 200 - /ps/skin/skin.svg' do
      visit '/ps/skin/skin.svg'
      page.status_code.should == 200
    end

    it 'preloader should 200 - /ps/skin/preloader.gif' do
      visit '/ps/skin/preloader.gif'
      page.status_code.should == 200
    end
  end
end
