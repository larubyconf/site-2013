set :application, "site-stage"

role :web, "alpha.larubyconf.com"
role :app, "alpha.larubyconf.com"
role :db,  "alpha.larubyconf.com"

set :rails_env, "staging"
