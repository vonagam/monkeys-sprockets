require 'sprockets'
require 'monkeys-sprockets'


describe 'sprockets' do

  before :all do

    @sprockets = Sprockets::Environment.new

    @sprockets.append_path CASES_DIR

    Monkeys::Changer.folder = OUPTPUTS_DIR

    Monkeys::Changer.sprockets = @sprockets

    Monkeys::Changer.ready = true

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
