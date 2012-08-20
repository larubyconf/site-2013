role :web, "alpha.larubyconf.com"
role :app, "alpha.larubyconf.com"
role :db,  "alpha.larubyconf.com", :primary => true

set :rails_env, "staging"
