
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
   if params.empty?
     @articles = Article.all 
     erb :index
   else  
    redirect "articles/#{params.keys[0]}"
    #binding.pry
   end
  end

  get '/articles/new' do
     erb :new
  end 

  post '/articles' do
    binding.pry
    @new_article = Article.create(params[:title], params[:content])
    
  end

  get '/articles/:id' do
    #binding.pry
    @requested_article = Article.find_by_id(params[:id])
    erb :show
  end

end
