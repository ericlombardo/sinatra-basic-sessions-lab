require_relative 'config/environment'
require 'sysrandom/securerandom'

class App < Sinatra::Base

  configure do
    enable :sessions
    # sets session_secret to environment variable, if not available it creates it's own
    set :session_secret, ENV.fetch('SESSION_SECRET') {SecureRandom.hex(64)}
  end

  get '/' do
    erb :index
  end

  post '/checkout' do
    session['item'] = params[:item]
    @session = session


    erb :show_item
  end
end