require 'selenium-webdriver'

class Meat_Shot

  def initialize

    puts "What URL do you want to shoot at?"
    @url = gets.chomp
  
    puts "\n\nWhat is the name of this project?"
    @file_name = gets.chomp

    puts "\n\nWhat ranges do you want to set the targets at? \n(320, 480, 980)\n"
    @media_queries = gets.chomp
    @media_queries = @media_queries.split","

    puts "\n\nWhat targets are we shooting at?\n\n"
    @selector = gets.chomp

    puts "\n\nIs there anything special we should do on this range?"
    @js = gets.chomp.to_s
	if !@js.empty?
      @js = File.read(@js)
    end
    


    @driver = Selenium::WebDriver.for :firefox
    @driver.get @url

    @el = @driver.find_elements(:css, @selector)
  
    display_working_array
    delete_from_working_array
  end

  def display_working_array
    @el.each_with_index do |x, i|
      puts "[#{i}] - #{x.attribute("href")}"
    end
  end
  
  def delete_from_working_array
    puts "Delete any pages"
    @del = gets.chomp.split(",")
    if !@del.empty?
	@del.each_with_index do |x, index|
      n = x.to_i - index
      @el.delete_at n
    end
	end
    display_working_array
    ready
  end
 
  def ready
    puts "Ready on the range. \n\n"

    @el.each_with_index do |link, index| 
      @num = index	   
       
      browse = Selenium::WebDriver.for :firefox
      browse.get "#{link.attribute("href")}"
      browse.execute_script(@js)  
      @media_queries.each_with_index do |size, index|
        puts "PULL!!\n\n"
	browse.manage.window.resize_to(size, 999)
        browse.save_screenshot("#{@file_name}-#{size}-#{@num}.png")
        puts "BANG!!\n\n" 
      end
  
    browse.close
    end
  end

 

end 

buckshot = Meat_Shot.new
