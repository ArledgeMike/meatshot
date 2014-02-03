require 'selenium-webdriver'

class Meat_Shot

  puts "What URL do you want to shoot at?"
  @url = gets.chomp
  
  puts "\n\nWhat is the name of this project?"
  @file_name = gets.chomp

  puts "\n\nWhat Size(s) are we shooting at?"
  @media_queries = gets.chomp
  @media_queries = @media_queries.split","

  @driver = Selenium::WebDriver.for :firefox
  @driver.get @url
  
 #target = @driver.find_elements(:tag_name, "a")
  puts "Ready on the range. \n\n"
  
  @media_queries.each{ |btn|
   
    puts "Pull! \n\n"
    @driver.manage.window.resize_to(btn, 999)
    @driver.save_screenshot("#{@file_name}_#{btn}.png")
    puts "BANG! \n\n "
  
   }  
  

end

buckshot = Meat_Shot.new
