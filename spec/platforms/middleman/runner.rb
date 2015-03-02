require 'middleman'
require 'middleman-core/application.rb'
require 'monkeys-sprockets'


GET_SPROCKETS = proc do

  ENV[ 'MM_ROOT' ] = 'spec/platforms/middleman'

  Middleman.server.inst.sprockets

end
