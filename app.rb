require 'sinatra'
 
class App < Sinatra::Base
 
  get '/' do
    <%= "I love " + "Ruby!!!"  %>
  end
 
end