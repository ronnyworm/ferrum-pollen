#!/usr/bin/env ruby
# frozen_string_literal: true

require 'ferrum'

browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil })

puts 'browser.go_to'
browser.go_to('https://allergie.hexal.de/pollenflug/vorhersage')
sleep 2

puts 'browser.at_css.type.enter'
puts "grabbing pollen for: #{ENV.fetch('PLZ', nil)}" if ENV['PLZ']
browser.at_css('#searchBox').focus.type(ENV.fetch('PLZ', '55262'), :enter)
sleep 2

puts 'browser.mouse.click'
browser.mouse.click(x: 800, y: 700)
sleep 1

6.times do
  puts 'browser.keyboard.type([:down])'
  browser.keyboard.type([:down])
  sleep 0.5
end

# a valid selector for ferrum can be a css element, like:
# browser.screenshot(selector: '.pollen-new', path: 'pollen.png')
browser.screenshot(path: 'pollen.png')
browser.quit
