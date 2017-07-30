class Mozart::CLI

  def call
    puts ""
    puts "WELCOME TO THE DESCRIPTION OF SYMPHONIES OF THE WORLD'S GREATEST COMPOSER OF ALL TIME!"
    puts ""
    puts "Would you like to see the list of symphonies by Wolfgang Amadeus Mozart? y/n:"
    input = gets.chomp.downcase
    if input == "y"
      puts "\t\n"
      scraper = Mozart::Symphony.scraper
      scraper.print_the_title
      puts "    ---------------------------------------------"
      scraper.scrape_symphonies_index
      puts ""
      scraper.print_symphonies_index
      puts ""
      start
    end
  end

  def start
    puts "Please enter the number of the symphony you would like more information on:"
    input = gets.chomp.to_i
    if !input.between?(1, 61)
      puts ""
      puts "Please enter a number from 1 to 61!"
      puts ""
      start
    end
    symphony = Mozart::Symphony.find(input)
    puts "\t\n"
    puts symphony.name_with_number.upcase
    puts "\t\n"
    puts "\t\t\t\t\t\t================== Description of the Symphony =================="
    puts "\t\n"
    puts symphony.description
    puts "\t\n"
    puts "\t\t\t\t\t\t================================================================="
    puts "\t\n"
    puts "Would you like to find out more about another symphony? y/n:"
    input = gets.chomp.downcase
    if input == "y"
      start
    else
      puts "\t\n"
      puts "Thank you for your interest! Have a great day, and welcome again in the future!"
      puts "\t\n"
      puts "\t\t\t**************************"
      puts "\t\n"
    end



  end

end
