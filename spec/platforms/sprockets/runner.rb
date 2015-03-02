require 'sprockets'
require 'monkeys-sprockets'


GET_SPROCKETS = proc do

  sprockets = Sprockets::Environment.new

  sprockets.append_path CASES_DIR

  Monkeys::Changer.folder = OUPTPUTS_DIR

  Monkeys::Changer.sprockets = sprockets

  Monkeys::Changer.ready = true

  sprockets

end
