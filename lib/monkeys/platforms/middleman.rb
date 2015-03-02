require 'middleman-core'


module Monkeys

  module Platforms

    class Middleman < ::Middleman::Extension

      option :folder, nil, 'A folder, where monkey patched files will be stored.' 

      def initialize ( app, options = {}, &block )

        super

        Monkeys::Changer.folder = options[ :folder ]

        app.after_configuration do

          Monkeys::Changer.sprockets = sprockets
          Monkeys::Changer.ready = true

        end

      end

    end

  end

end


::Middleman::Extensions.register :monkeys_sprockets, Monkeys::Platforms::Middleman
