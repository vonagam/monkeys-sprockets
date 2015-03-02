Rails.application.config.assets.paths << CASES_DIR

Rails.application.assets.cache = :nil

Monkeys::Changer.folder = OUPTPUTS_DIR
