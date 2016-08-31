#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

post '/visit' do
	username = params[:username]
	phone = params[:phone]
	date_time = params[:date_time]
	
	file = File.open "./public/users.txt", "a"
	file.write "{\"username\": \"#{username}\"; \"phone\": \"#{phone}\"; \"date_time\": \"#{date_time}\"}\n"
	file.close 

	@message = "#{username}, we will waiting for you at #{date_time}!"
	@title = "Thank you for visit!"

	erb :message

end

post '/contacts' do
	email =  params[:email]
	text = params[:text_area]

	file = File.open "./public/contacts.txt", "a"
	file.write "{\"email\": \"#{email}\"; \"text\": \"#{text}\"}\n"
	file.close 

	@message = "We send your email to BarberShop mail!"
	@title = "Thank you for your message!"

	erb :message
end