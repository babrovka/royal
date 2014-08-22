require 'rvm/capistrano'
require 'bundler/capistrano'
require 'thinking_sphinx/capistrano'
load 'deploy/assets'

server "109.120.165.36", :web, :app, :db, primary: true

set :user, "babrovka"
set :application, "rbcos"
set :deploy_to, "/home/#{user}/projects/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :port, 34511
set :rvm_ruby_version, '2.1.2@rbcos'
set :scm, "git"
set :repository, "git@github.com:babrovka/royal.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true




task :copy_database_config do
   db_config = "#{shared_path}/database.yml"
   run "cp #{db_config} #{latest_release}/config/database.yml"
end

task :copy_secret_config do
   db_config = "#{shared_path}/secrets.yml"
   run "cp #{db_config} #{latest_release}/config/secrets.yml"
end

task :public_system_symlink do
   run "rm -rf -- #{latest_release}/public/system && ln -s -- /shared_images #{latest_release}/public/system"
end

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

namespace(:log) do
  task :rails do
    run %Q{cd #{shared_path} && tailf -n 50 log/production.log }
  end
  
  task :thin do
    run %Q{cd #{shared_path} && tailf -n 50 log/thin.log }
  end
end

namespace(:deploy) do
  task :stop do
    run %Q{cd #{latest_release} && bundle exec thin stop -C #{shared_path}/thin.yml}
   end
  
  task :start do
    run %Q{cd #{latest_release} && bundle exec thin start -C #{shared_path}/thin.yml}
  end

  task :restart do
    stop
    start
  end
end

before 'deploy:update_code', 'thinking_sphinx:stop'
after 'deploy:update_code', 'thinking_sphinx:start'
after 'deploy:update_code', 'thinking_sphinx:rebuild'

before "deploy:assets:precompile", "copy_database_config"
after "copy_database_config", "copy_secret_config"
after "copy_secret_config", "public_system_symlink"