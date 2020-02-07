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
     $player_1 = Player.new(params[:player_1_name])
     $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    erb :play
  end
  
  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2)
    erb :attack
  end

  run! if app_file == $0
end
