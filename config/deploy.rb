# RVM bootstrap
$:.unshift("/usr/local/rvm/lib")
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2-p290'
#set :rvm_type, :user

set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:/usr/local/rvm/bin/:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.2p290',
  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.2-p290'  # If you are using bundler.
}
# bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "fr3drikstad.com"
role :web, "fr3drikstad.com"
role :app, "fr3drikstad.com"
role :db, "fr3drikstad.com", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/rails/kvittering"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "passenger"
set :repository, "git@github.com:StianF/receipts.git"
set :branch, "master"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end
  
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc"Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "chmod -R 775 #{release_path}"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
