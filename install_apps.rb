#! /usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'
require 'json'

APPS = [
  { name: 'Mozilla Firefox', id: 'Mozilla.Firefox' },
  { name: 'Visual Studio Code', id: 'Microsoft.VisualStudioCode' },
  { name: 'KeePassXC', id: 'KeePassXCTeam.KeePassXC' },
  { name: 'Dropbox', id: 'Dropbox.Dropbox' },
  { name: 'Evernote', id: '9WZDNCRFJ3MB' },
  { name: 'Spotify', id: '9NCBCSZSJRSB' },
  { name: 'Discord', id: 'Discord.Discord' },
  { name: 'Git', id: 'Git.Git' },
  { name: 'Foxit PDF Reader', id: 'Foxit.FoxitReader' },
  { name: 'Visual Studio Community 2022', id: 'Microsoft.VisualStudio.2022.Community' },
  { name: 'Dolby Access', id: '9N0866FS04W8' },
  { name: 'Character Map UWP', id: '9WZDNCRDXF41' },
  { name: 'EarTrumpet', id: '9NBLGGH516XP' },
  { name: 'TranslucentTB', id: '9PF4KZ2VN4W9' },
  { name: 'Microsoft PowerToys', id: 'Microsoft.PowerToys' },
  { name: 'NVM for Windows', id: 'CoreyButler.NVMforWindows' },
  { name: 'Steam', id: 'Valve.Steam' },
  { name: 'PowerShell', id: 'Microsoft.PowerShell' },
  { name: 'Windows Terminal', id: '9N0DX20HK701' },
  { name: 'Telegram Desktop', id: 'Telegram.TelegramDesktop' },
  { name: 'NordVPN', id: 'NordVPN.NordVPN' },
  { name: 'NordLocker', id: 'Nord.NordLocker' },
  { name: 'AutoHotKey', id: 'AutoHotKey' },
  { name: 'NanaZip', id: '9N8G7TSCL18R' },
  { name: 'Cloudflare WARP', id: 'Cloudflare.Warp' },
  { name: 'IntelliJ IDEA Community Edition', id: 'JetBrains.IntelliJIDEA.Community' },
  { name: 'Shotcut', id: 'Meltytech.Shotcut' },
  { name: 'Krita', id: 'KDE.Krita' },
  { name: 'KritaShellExtension', id: 'KDE.KritaShellExtension' }
].freeze

puts "Stage 1: Winget -- #{APPS.length} apps to install."

APPS.each_with_index do |app, index|
  puts "#{index + 1} of #{APPS.length}: Installing #{app[:name]} via winget..."
  # system "winget install --id \"#{app[:id]}\""
  puts ''
end

puts 'Stage 1 done.'
puts 'Script paused, check environment before proceed.'
system 'pause'
puts ''

puts 'Stage 2: Custom installations'
puts ''

TEMP_WORKSPACE_NAME = 'temp-worksapce'
Dir.rmdir(TEMP_WORKSPACE_NAME) if Dir.exist?(TEMP_WORKSPACE_NAME)
Dir.mkdir(TEMP_WORKSPACE_NAME)
Dir.chdir(TEMP_WORKSPACE_NAME)

custom_plans = Dir.children('custom-installations')
custom_plans.each_with_index do |plan, index|
  print "#{index} of #{custom_plans.length}: "
  require_relative "./custom-installations/#{plan}"
  puts ''
end

Dir.chdir('..')

puts 'Stage 2 done.'
puts ''

puts 'Installation done.'
