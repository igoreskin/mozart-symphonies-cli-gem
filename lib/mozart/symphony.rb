class Mozart::Symphony

  attr_accessor :name, :description, :url

  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  @@scraper = Mozart::Scraper.new

  def self.scraper
    @@scraper
  end

  def self.find(number)
    self.all[number - 1]
  end

  def name_with_number
    @@scraper.scrape_symphony_name_with_number(@url)
  end

  def description
    @@scraper.scrape_symphony_description(@url)
  end

end
