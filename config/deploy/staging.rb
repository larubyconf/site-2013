role :web, "beta.larubyconf.com"
role :app, "beta.larubyconf.com"
role :db,  "beta.larubyconf.com", :primary => true

set :rails_env, "staging"
