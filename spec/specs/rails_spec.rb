require 'combustion'

Combustion.path = 'spec/platforms/rails'
Combustion.initialize! :sprockets


describe 'rails' do

  before :all do

    @sprockets = Rails.application.assets

  end

  describe 'cases' do

    CASES.each do | name |

      it name do

        binding.eval IO.read CASES_DIR.join( name, 'change.rb' )

        expected = IO.read CASES_DIR.join( name, 'output.txt' )

        gained = IO.read OUPTPUTS_DIR.join( 'monkeys', name, 'input.txt' )

        expect( expected ).to eq gained

      end

    end

  end

end
