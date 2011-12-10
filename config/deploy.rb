set :application, "rdsnovelties"
set :repository,  "git@github.com:ncimino/rdsnovelties.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "root"  # The server's user for deploys
set :deploy_to, "/srv/www/#{application}"
set :use_sudo, false

set :normalize_asset_timestamps, false

role :web, "rds.econtriver.com"                          # Your HTTP server, Apache/etc
role :app, "rds.econtriver.com"                          # This may be the same as your `Web` server
role :db,  "rds.econtriver.com", :primary => true # This is where Rails migrations will run

files = ['config/initializers/omniauth.rb','config/database.yml']


task :migrate, :hosts => "rds.econtriver.com" do
  run "cd #{File.join(deploy_to,'current')}; bundle exec rake db:migrate RAILS_ENV=production"
end

task :bundle, :hosts => "rds.econtriver.com" do
  run "cd #{File.join(deploy_to,'current')}; bundle install --without development test"
end

task :link_secret, :hosts => "rds.econtriver.com" do
  run files.collect{|f| "ln -s #{File.join(deploy_to,'private',f)} `readlink -f #{File.join(deploy_to,'current',f)}`" }.join(";")
end

task :put_secret do
  files.each do |f|
    system("scp #{f} #{user}@econtriver.com:#{File.join(deploy_to,'private',f)}")
  end
end

task :get_secret do
  files.each do |f|
    system("scp #{user}@econtriver.com:#{File.join(deploy_to,'private',f)} #{f}")
  end
end


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :mysql do
  desc "performs a backup (using mysqldump) in app shared dir"
  task :backup, :roles => :db, :only => { :primary => true } do
    filename = "#{application}.db_backup.#{Time.now.to_f}.sql.bz2"
    filepath = "#{shared_path}/#{filename}"
    text = capture "cat #{deploy_to}/current/config/database.yml"
    yaml = YAML::load(text)

    on_rollback { run "rm #{filepath}" }
    run "mysqldump -u #{yaml['production']['username']} -p #{yaml['production']['database']} | bzip2 -c > #{filepath}" do |ch, stream, out|
      ch.send_data "#{yaml['production']['password']}\n" if out =~ /^Enter password:/
    end

  end

end

#before :deploy, 'mysql:backup'
#after :deploy, :link_secret
#after :link_secret, :bundle
#after :bundle, :migrate
