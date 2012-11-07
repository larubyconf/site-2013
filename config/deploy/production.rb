role :web, "2013.larubyconf.com"
role :app, "2013.larubyconf.com"
role :db,  "2013.larubyconf.com", :primary => true

set :rails_env, 'production'
