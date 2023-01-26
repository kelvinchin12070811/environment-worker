#! /usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'fileutils'

require_relative './winget_apps_list'

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

TEMP_WORKSPACE_NAME = 'temp-workspace'
FileUtils.rm_r(TEMP_WORKSPACE_NAME) if Dir.exist?(TEMP_WORKSPACE_NAME)
Dir.mkdir(TEMP_WORKSPACE_NAME)
Dir.chdir(TEMP_WORKSPACE_NAME)

custom_plans = Dir.children('../custom-installations')
custom_plans.each_with_index do |plan, index|
  print "#{index + 1} of #{custom_plans.length}: "
  require_relative "./custom-installations/#{plan}"
  puts ''
end

Dir.chdir('..')

puts 'Stage 2 done.'
puts ''

puts 'Installation done.'
