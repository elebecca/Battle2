require 'sinatra/base'
require 'sinatra'
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
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :play
  end
  
  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :attack
  end

  run! if app_file == $0
end
