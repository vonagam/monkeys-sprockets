require 'rails/engine'


module Monkeys

  module Platforms

    class Rails < ::Rails::Engine

      initializer 'monkeys_sprockets.setup_engine', group: :all do | app |

        Monkeys::Changer.folder ||= app.root.join 'vendor/assets/monkeys'
        Monkeys::Changer.sprockets = app.assets

        app.config.after_initialize do

          Monkeys::Changer.ready = true

        end

      end

    end

  end

end
