require_relative "../../config/environment"
require_relative "../models/donation.rb"
require_relative "../models/donor.rb"
require_relative "../models/project.rb"

class ApplicationController < Sinatra::Base
  
  configure do
  set :views, "app/views"
  set :public, "public"
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
  erb :donors
  end
end 