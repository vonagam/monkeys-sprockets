require 'combustion'

Combustion.path = 'spec/platforms/rails'
Combustion.initialize! :sprockets


describe 'rails' do

  before :all do

    @sprockets = Rails.application.assets

  end

  it 'hello' do
  end

end
