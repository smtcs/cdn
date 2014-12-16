require_relative '../spec_helper'

describe 'Misc routes', :type => :feature do
  describe 'jquery', :type => :feature do
    it '1 should 200 - /jq/1.js' do
      visit '/jq/1.js'
      page.status_code.should == 200
    end

    it '2 should 200 - /jq/2.js' do
      visit '/jq/2.js'
      page.status_code.should == 200
    end
  end

  describe 'font awesome', :type => :feature do
    it 'css should 200 - /fa/fa.css' do
      visit '/fa/fa.css'
      page.status_code.should == 200
    end

    describe 'fonts', :type => :feature do
      it '.eot should 200 - /fa/fonts/fontawesome-webfont.eot' do
        visit '/fa/fonts/fontawesome-webfont.eot'
        page.status_code.should == 200
      end

      it '.svg should 200 - /fa/fonts/fontawesome-webfont.svg' do
        visit '/fa/fonts/fontawesome-webfont.svg'
        page.status_code.should == 200
      end

      it '.ttf should 200 - /fa/fonts/fontawesome-webfont.ttf' do
        visit '/fa/fonts/fontawesome-webfont.ttf'
        page.status_code.should == 200
      end

      it '.woff should 200 - /fa/fonts/fontawesome-webfont.woff' do
        visit '/fa/fonts/fontawesome-webfont.woff'
        page.status_code.should == 200
      end
    end
  end

  describe 'highlight js', :type => :feature do
    it 'hl.js should 200 - /hl/hl.js' do
      visit '/hl/hl.js'
      page.status_code.should == 200
    end
  end

  it 'skeleton should 200 - /sk.css' do
    visit '/sk.css'
    page.status_code.should == 200
  end

  it 'normalize should 200 - /nl.css' do
    visit '/nl.css'
    page.status_code.should == 200
  end

  it 'simple should 200 - /sm.css' do
    visit '/sm.css'
    page.status_code.should == 200
  end
end
