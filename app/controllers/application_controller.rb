
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
    redirect "articles/:id"
    #binding.pry
   end
  end

  get '/articles/:id' do
    binding.pry
    @requested_article = Article.find_by_id(params[:id])
    erb :show
  end

end
