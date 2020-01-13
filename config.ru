require './config/environment.rb'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride   # needed to perform Put, Patch and Delete.  Its middleware.
use SessionsController
use PodcastsController
use UsersController 
run ApplicationController
