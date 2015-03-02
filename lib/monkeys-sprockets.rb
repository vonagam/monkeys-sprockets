require 'sprockets'
require 'pathname'

require 'monkeys/version'
require 'monkeys/changer'

require 'monkeys/platforms/rails' if defined? Rails
require 'monkeys/platforms/middleman' if defined? Middleman
