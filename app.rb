require 'selenium-webdriver'

class Meat_Shot

def initialize
  puts "What URL do you want to shoot at?"
  @url = gets.chomp
  
#  puts "\n\nWhat is the name of this project?"
#  @file_name = gets.chomp

#  puts "\n\nWhat ranges do you want to set the targets at? \n(320, 480, 980)\n"
#  @media_queries = gets.chomp
#  @media_queries = @media_queries.split","

  puts "\n\nWhat targets are we shooting at?\n\n"
  @selector =  gets.chomp

  @driver = Selenium::WebDriver.for :firefox
  @driver.get @url

  @el = @driver.find_elements(:css, @selector)
 @num = 0
  @el.each_with_index do |x, i|
     @num = @num + 1
	  puts "[#{i}] - #{x.attribute("href")}"

  end

puts "Delete any pages"
@del = gets.chomp.split(",")
puts @del


@del.each do |int|
    
    @el.delete_at int.to_i

end

@el.each_with_index do |x, i|

	puts "[#{i}] - #{x.attribute("href")}"

end

def ready
  puts "Ready on the range. \n\n"

  @el.each do |link| 
    browse = Selenium::WebDriver.for :firefox
    name = shorten_url(link.attribute("href"))
    browse.action.key_down(:esc).key_up(:esc)  
    @media_queries.each do |size|
        puts "PULL!!"
	browse.manage.window.resize_to(size, 999)
        browse.save_screenshot("#{name}#{size}.png")
      end
    puts"\n\nBANG!!"
    browse.close
  end
end

 def shorten_url(url)
    @new =  url.slice! "https://www."
      url.gsub!(".com/","-")
 end
end 

end
  
  


buckshot = Meat_Shot.new
