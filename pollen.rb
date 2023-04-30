#!/usr/bin/env ruby

require "ferrum"

browser = Ferrum::Browser.new(browser_options: { 'no-sandbox': nil })
puts "browser.go_to"
browser.go_to("https://allergie.hexal.de/pollenflug/vorhersage")
sleep 2
puts "browser.at_css.type.enter"
element = browser.at_css('#searchBox').focus.type('97072', :enter)
sleep 2
puts "browser.mouse.click"
browser.mouse.click( x: 800, y: 700 )
sleep 1
(0..5).each do
  puts "browser.keyboard.type([:down])"
  browser.keyboard.type([:down])
  sleep 0.5
end
browser.screenshot(path: "pollen.png")
browser.quit

timestamp = Time.now.strftime("%Y-%m-%d %H:%M")
`sed -i 's#.*span.*#  <span>Update #{timestamp}</span>#' index.html`

