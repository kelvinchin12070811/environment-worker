# frozen_string_literal: true

puts 'Installing yarn...'
system 'corepack enable'
system 'yarn set version stable'
