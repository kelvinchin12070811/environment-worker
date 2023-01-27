# frozen_string_literal: true

require 'fileutils'

INSTALL_PATH = 'C:\\Portable Program Files'

puts 'Installing lf...'

current_path = Dir.pwd

puts "Enter install path (default #{INSTALL_PATH}): "
print '> '
selected = gets.chop
selected = selected.empty? ? INSTALL_PATH : selected
puts "Installing lf in #{selected}"

puts 'Enter bash binary path:'
print '> '
bash_path = gets.chop

FileUtils.mkdir(selected) unless Dir.exist?(selected)
FileUtils.cd(selected)

puts 'Downloading...'
system 'git clone https://github.com/dylanaraps/neofetch.git'
FileUtils.cd('neofetch')
launcher = File.open('neofetch.cmd', 'w')
launcher.puts("@echo off\n\"#{bash_path}\" \"%~dp0neofetch\"")
launcher.close

puts 'Linking...'
system('pwsh -Command "[Environment]::SetEnvironmentVariable(\"Path\", ' \
     "\\\"#{FileUtils.pwd.gsub('/', '\\')};\\\" + " \
     '[Environment]::GetEnvironmentVariable(\"Path\", [EnvironmentVariableTarget]::Machine)' \
     ', [EnvironmentVariableTarget]::Machine)"')

FileUtils.cd(current_path)
