require 'pry'


CASES_DIR = Pathname.new( __FILE__ ).dirname.join( 'cases' )


OUPTPUTS_DIR = Pathname.new( __FILE__ ).dirname.join( 'outputs' )


CASES = Dir[ 'spec/cases/**/change.rb' ].each do | entry |

  entry.sub! /spec\/cases\/(.+)\/change.rb/, '\1'

end


[ 'rails', 'middleman', 'sprockets' ].each do | gem_name |

  if Gem.find_files( gem_name ).empty? == false

    require "platforms/#{ gem_name }/runner"

    break

  end

end


require 'specs/monkeys_spec'
