require 'sinatra/base'
require 'sinatra'
require './lib/player.rb'
require './lib/game.rb'

set :session_secret, 'suoper secret'

class Battle < Sinatra::Base
  enable :sessions
  # get '/' do
  #   'Testing infrastructure working!'
  # end
  # run! if app_file == $0

  get '/' do
    erb :index
  end
  
  post '/names' do
     player_1 = Player.new(params[:player_1_name])
     player_2 = Player.new(params[:player_2_name])
     $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end
  
  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    erb :attack
  end

  run! if app_file == $0
end
