require 'pry'
require 'nokogiri'
require 'open-uri'

class Mozart::Scraper

  def get_page
    Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_symphonies_by_Wolfgang_Amadeus_Mozart'))
  end

  def print_the_title
    puts "    #{self.get_page.css('h1').text}"
  end


  def scrape_symphonies_index
    self.get_page.css(".sorttext")[0..60].each { |el| Mozart::Symphony.new("#{el.text}, #{el.css("a").attr("title").text}", "https://en.wikipedia.org" + el.css("a").attr("href").text) }
  end

  def print_symphonies_index
    Mozart::Symphony.all.each.with_index do |el, index|
      puts "#{index+1}.\t#{el.name[/(.*)\s/,1]}"
    end
    nil
  end

  def print_symphonies_urls
    Mozart::Symphony.all.each.with_index { |el, index| puts "#{index+1}.\t#{el.url}" }
    nil
  end

  def get_symphony_page(url)
    Nokogiri::HTML(open(url))
  end

  def scrape_symphony_name_with_number(url)
    self.get_symphony_page(url).css(".mw-parser-output p b").text
  end

  def scrape_symphony_description(url)
    self.get_symphony_page(url).css("p").text
  end

  # The following methods only scrape first 11 elements:

  # def scrape_keys
  #   self.get_page.css("td").css("a")[0..60].each { |el| puts el.attr("title") }
  # end

  # def scrape_years
  #   self.get_page.css("td")[0..60].each { |el| puts el.text }
  # end

end
