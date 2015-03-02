# this file not needed in real app
# unless you want to change the monkeys output folder
# which is 'vendor/assets/monkeys' by default

Rails.application.config.assets.paths << CASES_DIR

Rails.application.assets.cache = :nil

Monkeys::Changer.folder = OUPTPUTS_DIR
