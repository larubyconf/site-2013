role :web, "2014.larubyconf.com"
role :app, "2014.larubyconf.com"
role :db,  "2014.larubyconf.com", :primary => true

set :rails_env, "staging"
