require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open("#{index_url}")
    data = Nokogiri::HTML(html).css('div.roster-cards-container')
    data_table = data.css('a').collect {|l| l.text}
    data_table[0].split("\n").strip
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
