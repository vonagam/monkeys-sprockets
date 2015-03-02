require 'middleman'
require 'middleman-core/application.rb'
require 'monkeys-sprockets'


describe 'middleman' do

  before :all do

    ENV[ 'MM_ROOT' ] = 'spec/platforms/middleman'

    @sprockets = Middleman.server.inst.sprockets

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
