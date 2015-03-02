require 'fileutils'


describe 'monkeys' do

  before :all do

    @sprockets = GET_SPROCKETS.call

  end

  after :all do

    FileUtils.rm_rf OUPTPUTS_DIR

  end

  it 'monkeys path in sprockets' do

    expect( @sprockets.paths ).to include Monkeys::Changer.folder.to_s

  end

  describe 'cases' do

    CASES.each do | name |

      it name do

        binding.eval IO.read CASES_DIR.join( name, 'change.rb' )

        expected = IO.read CASES_DIR.join( name, 'output.txt' )

        gained = IO.read OUPTPUTS_DIR.join( 'monkeys', name, 'input.txt' )

        expect( gained ).to eq expected

      end

    end

  end

end
