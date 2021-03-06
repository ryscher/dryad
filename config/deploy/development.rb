# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}

set :rails_env, "development"

# To override the default host, set $SERVER_HOSTS, e.g.
#    $ SERVER_HOSTS='localhost1 localhost2' bundle exec cap development deploy
#set :server_hosts, ENV["SERVER_HOSTS"]&.split(' ') || 'dryad-dev.cdlib.org'
set :server_hosts, ENV["SERVER_HOSTS"]&.split(' ') || 'uc3-dryaduix2-dev.cdlib.org'
role :app, fetch(:server_hosts), user: 'dryad'

#on roles(:all) do |host|
#  puts "setting server host: #{host.hostname}"
#end

#set :passenger_pid, "#{deploy_to}/passenger.pid"
#set :passenger_log, "#{deploy_to}/passenger.log"
#set :passenger_port, "3000"


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

namespace :deploy do

  #desc 'update local engines to get around requiring version number changes in development'
  #task :update_local_engines do
  #  on roles(:app) do
  #    my_branch = capture("cat #{deploy_to}/current/branch_info")
  #
  #    %w(stash_datacite stash_engine stash_discovery).each do |engine|
  #      execute "cd #{deploy_to}/#{engine}; git checkout #{my_branch}; git reset --hard origin/#{my_branch}; git pull"
  #    end

      # execute "cd #{deploy_to}/stash_datacite; git checkout #{my_branch}; git reset --hard origin/#{my_branch}; git pull"
      # execute "cd #{deploy_to}/stash_engine; git checkout #{my_branch}; git reset --hard origin/#{my_branch}; git pull"
  #  end
  #end

  #after :published, :update_local_engines
end
