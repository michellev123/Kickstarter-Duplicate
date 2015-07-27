require_relative "../../config/environment"
require_relative "../models/donation.rb"
require_relative "../models/donor.rb"
require_relative "../models/project.rb"

class ApplicationController < Sinatra::Base
  
configure do
  set :views, "app/views"
  set :public, "public"
  set :sessions, true
  set :session_secret, "kickd"
   
end

get '/' do
  erb :index
end 

get '/signup' do
  erb :signup
end

post '/signup' do
  @donor= Donor.new({:username => params[:username], :full_name => params[:full_name], :phone_number => params[:phone_number], :email => params[:email], :credit_card => params[:credit_card]})
  @donor.save
  session[:user_id] = @donor.id
  redirect('/new_project')
end 

get '/login' do 
  erb :login
end 

post '/login' do
  @donor = Donor.find_by(:username => params[:username], :email => params[:email])
  if @donor
    session[:user_id] = @donor.id
    redirect('/new_project')
  else
    erb :error
  end
end

get '/new_project' do 
  erb :new_project
end 

post '/new_project' do 
  @project = Project.new({:genre => params[:genre], :title => params[:title], :goal => params[:goal], :image_file => params[:image_file], :description => params[:description], :location => params[:location], :duration => [:duration], :donor_id => params[:donor_id]})
  @project.save
  @the_projects = Project.all
  erb :results
 
end 
post '/results' do 
  @project = Project.new({:genre => params[:genre], :title => params[:title], :goal => params[:goal], :image_file => params[:image_file], :description => params[:description], :location => params[:location], :duration => [:duration], :donor_id => params[:donor_id]})
  @project.save
  @the_projects = Project.all
  erb :results
 
end



end 