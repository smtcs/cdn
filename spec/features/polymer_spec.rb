require_relative '../spec_helper'

describe 'Polymer routes', :type => :feature do
  it 'html should 200 - /pl/pl.html' do
    visit '/pl/pl.html'
    page.status_code.should == 200
  end

  it 'js should 200 - /pl/polymer.js' do
    visit '/pl/polymer.js'
    page.status_code.should == 200
  end

  it 'wc should 200 - /pl/wc.js' do
    visit '/pl/wc.js'
    page.status_code.should == 200
  end

  it 'layout should 200 - /pl/layout.html' do
    visit '/pl/layout.html'
    page.status_code.should == 200
  end

  describe 'custom elements', :type => :feature do
    describe 'paper', :type => :feature do
      Dir['./libs/polymer/*/paper-*.html'].each do |file|
        route = file[15..file.length]
        name = route.split('/').first
        it "#{name[6..name.length]} should 200 - /polymer/#{route}" do
          visit "/polymer/#{route}"
          page.status_code.should == 200
        end
      end
    end

    describe 'core', :type => :feature do
      Dir['./libs/polymer/*/core-*.html'].each do |file|
        route = file[15..file.length]
        name = route.split('/').first
        it "#{name[5..name.length]} should 200 - /polymer/#{route}" do
          visit "/polymer/#{route}"
          page.status_code.should == 200
        end
      end
    end
  end
end
