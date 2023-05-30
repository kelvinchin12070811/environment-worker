# frozen_string_literal: true

require 'json'

puts 'Installing Hibbiki.Chromium...'
puts 'Searching installation binaries...'
chromium_releses = `curl https://api.github.com/repos/Hibbiki/Chromium-win64/releases/latest`
chromium_assets = JSON.parse(chromium_releses)['assets']
chromium_assets.each do |asset|
  next unless asset['name'] == 'mini_installer.sync.exe'

  puts "\nFound #{asset['name']}, downloading..."
  `curl -OL #{asset['browser_download_url']}`
  if File.exist?('mini_installer.sync.exe')
    puts "\nInstalling..."
    `mini_installer.sync.exe`
  end
  break
end
