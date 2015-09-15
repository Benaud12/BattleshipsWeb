require 'sinatra/base'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    'Hello BattleshipsWeb!'
    erb :index
  end

  get '/askname' do
    'What is your name?'
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
