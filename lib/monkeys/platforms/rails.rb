require 'rails/engine'


module Monkeys

  module Platforms

    class Rails < ::Rails::Engine

      initializer 'monkeys_sprockets.setup_engine', group: :all do | app |

        sprockets = app.assets

        folder = app.root.join 'vendor/assets/monkeys'

        Monkeys::Changer.folder = folder

        sprockets.append_path folder

        app.config.after_initialize do

          Monkeys::Changer.execute app.assets

        end

      end

    end

  end

end
