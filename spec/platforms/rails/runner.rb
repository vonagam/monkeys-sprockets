require 'combustion'


GET_SPROCKETS = proc do

  Combustion.path = 'spec/platforms/rails'
  Combustion.initialize! :sprockets

  Rails.application.assets

end
