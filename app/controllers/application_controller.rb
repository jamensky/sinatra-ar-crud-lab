
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
   end
  end

  get '/articles/new' do
    erb :new
  end 

  post '/articles' do
    @new_article = Article.create(params)
    redirect "/articles/#{@new_article.id}"
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article_to_edit = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
     @article = Article.find_by_id(params[:id])
     @article.title = params[:title]
     @article.content = params[:content]
     @article.save 
     
     erb :show
  end 

  delete '/articles/:id' do 
     Article.find_by_id(params[:id]).delete
  end 


end
