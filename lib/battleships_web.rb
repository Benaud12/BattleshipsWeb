require 'sinatra/base'
require_relative 'board'
require_relative 'cell'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/New_Game' do
    @name = params[:name]
    erb :new_game
  end

  get '/grid' do
    @grid = Board.new(cell: Cell, size: 100).show
    erb :grid
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
