require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require './app/models/peep'
require './app/models/user'
require './app/controllers/application'
require './app/controllers/peeps'
require './app/controllers/users'
require './app/controllers/sessions'

require_relative 'helpers/application'
require_relative 'data_mapper_setup.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb