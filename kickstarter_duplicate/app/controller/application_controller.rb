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