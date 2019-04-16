require 'nokogiri' 
require 'open-uri' 

html = open("https://flatironshool.com/" )
doc = Nokogiri::HTML(html) 
puts doc 