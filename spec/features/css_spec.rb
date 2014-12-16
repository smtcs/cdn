require_relative '../spec_helper'

describe 'CSS Framework routes', :type => :feature do
  describe 'bootstrap', :type => :feature do
    it '3.3.1 css should 200 - /bs/bs.css' do
      visit '/bs/bs.css'
      page.status_code.should == 200
      page.should have_content 'Bootstrap v3.3.1'
    end

    it '3.3.1 js should 200 - /bs/bs.js' do
      visit '/bs/bs.js'
      page.status_code.should == 200
      page.should have_content 'Bootstrap v3.3.1'
    end

    it '3.3.1 theme should 200 - /bs/theme.css' do
      visit '/bs/theme.css'
      page.status_code.should == 200
      page.should have_content 'Bootstrap v3.3.1'
    end

    it '2.3.2 css should 200 - /bs/bs.css?v=2.3' do
      visit '/bs/bs.css?v=2.3'
      page.status_code.should == 200
      page.should have_content 'Bootstrap v2.3.2'
    end

    it '2.3.2 js should 200 - /bs/bs.js?v=2.3' do
      visit '/bs/bs.js?v=2.3'
      page.status_code.should == 200
      page.should have_content 'Copyright 2013 Twitter, Inc.'
    end

    describe 'fonts', :type => :feature do
      it '.eot should 200 - /bs/fonts/glyphicons-halflings-regular.eot' do
        visit '/bs/fonts/glyphicons-halflings-regular.eot'
        page.status_code.should == 200
      end

      it '.svg should 200 - /bs/fonts/glyphicons-halflings-regular.svg' do
        visit '/bs/fonts/glyphicons-halflings-regular.svg'
        page.status_code.should == 200
      end

      it '.ttf should 200 - /bs/fonts/glyphicons-halflings-regular.ttf' do
        visit '/bs/fonts/glyphicons-halflings-regular.ttf'
        page.status_code.should == 200
      end

      it '.woff should 200 - /bs/fonts/glyphicons-halflings-regular.woff' do
        visit '/bs/fonts/glyphicons-halflings-regular.woff'
        page.status_code.should == 200
      end
    end
  end

  describe 'materialize', :type => :feature do
    it 'css should 200 - /md/md.css' do
      visit '/md/md.css'
      page.status_code.should == 200
      page.should have_content 'normalize.css v3.0.1'
    end

    it 'js should 200 - /md/md.js' do
      visit '/md/md.js'
      page.status_code.should == 200
      page.should have_content 'jQuery Easing v1.3'
    end

    describe 'icons', :type => :feature do
      it '.eot should 200 - /md/font/mdi/Material-Design-Icons.eot' do
        visit '/md/font/mdi/Material-Design-Icons.eot'
        page.status_code.should == 200
      end

      it '.svg should 200 - /md/font/mdi/Material-Design-Icons.svg' do
        visit '/md/font/mdi/Material-Design-Icons.svg'
        page.status_code.should == 200
      end

      it '.ttf should 200 - /md/font/mdi/Material-Design-Icons.ttf' do
        visit '/md/font/mdi/Material-Design-Icons.ttf'
        page.status_code.should == 200
      end

      it '.woff should 200 - /md/font/mdi/Material-Design-Icons.woff' do
        visit '/md/font/mdi/Material-Design-Icons.woff'
        page.status_code.should == 200
      end
    end

    describe 'font', :type => :feature do
      it 'bold should 200 - /md/font/roboto/Roboto-Bold.ttf' do
        visit '/md/font/roboto/Roboto-Bold.ttf'
        page.status_code.should == 200
      end

      it 'light should 200 - /md/font/roboto/Roboto-Light.ttf' do
        visit '/md/font/roboto/Roboto-Light.ttf'
        page.status_code.should == 200
      end

      it 'medium should 200 - /md/font/roboto/Roboto-Medium.ttf' do
        visit '/md/font/roboto/Roboto-Medium.ttf'
        page.status_code.should == 200
      end

      it 'regular should 200 - /md/font/roboto/Roboto-Regular.ttf' do
        visit '/md/font/roboto/Roboto-Regular.ttf'
        page.status_code.should == 200
      end

      it 'thin should 200 - /md/font/roboto/Roboto-Thin.ttf' do
        visit '/md/font/roboto/Roboto-Thin.ttf'
        page.status_code.should == 200
      end
    end
  end
end
