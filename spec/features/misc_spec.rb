require_relative '../spec_helper'

describe 'Misc routes', :type => :feature do
  describe 'jquery', :type => :feature do
    it '1 should 200 - /jq/1.js' do
      visit '/jq/1.js'
      page.status_code.should == 200
      page.should have_content 'jQuery JavaScript Library v1.11.1'
    end

    it '2 should 200 - /jq/2.js' do
      visit '/jq/2.js'
      page.status_code.should == 200
      page.should have_content 'jQuery JavaScript Library v2.1.1'
    end
  end

  describe 'font awesome', :type => :feature do
    it 'css should 200 - /fa/fa.css' do
      visit '/fa/fa.css'
      page.status_code.should == 200
      page.should have_content 'Font Awesome 4.2.0'
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
      page.should have_content '!function(e)'
    end

    describe 'themes', :type => :feature do
      Dir['./libs/hljs/styles/*.css'].each do |file|
        name = file[19..file.length-5]
        route = file[19..file.length]
        it "#{name} should 200 - /hl/#{route}" do
          visit "/hl/#{route}"
          page.status_code.should == 200
        end
      end
    end
  end

  it 'skeleton should 200 - /sk.css' do
    visit '/sk.css'
    page.status_code.should == 200
    page.should have_content 'Skeleton V2.0'
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
