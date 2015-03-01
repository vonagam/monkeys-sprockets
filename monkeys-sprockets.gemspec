# coding: utf-8

lib = File.expand_path( '../lib', __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )
require 'monkeys/version'

Gem::Specification.new do | spec |

  spec.name          = 'monkeys-sprockets'
  spec.version       = Monkeys::VERSION
  spec.authors       = [ 'Dmitry Maganov' ]
  spec.email         = [ 'vonagam@gmail.com' ]
  spec.summary       = 'Monkey patch any asset file with Sprockets.'
  spec.description   = 'Change, replace, add lines in any vendor asset.'
  spec.homepage      = 'https://github.com/vonagam/monkeys-sprockets'
  spec.license       = 'MIT'

  spec.files         = Dir[
    'lib/**/*',
    'README.md',
    'LICENSE.txt'
  ]
  spec.require_paths = [ 'lib' ]


  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'execjs'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'sprockets', '>= 2.2.2'

end
