require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_index_array = []
      html = open("#{index_url}")
      data = Nokogiri::HTML(html).css('div.roster-cards-container')
      data.css('a').collect do |l|
        student_hash = {}
        student_hash[:name] = l.css('h4').text
        student_hash[:location] = l.css('p').text
        student_hash[:profile_url] = "#{l['href']}"
        student_index_array << student_hash
      end
      student_index_array
  end

  def self.scrape_profile_page(profile_url)
    student_hash = {}
      html = open("#{profile_url}")
      data = Nokogiri::HTML(html).css('div.social-icon-container')
      binding.pry
      data.css('a').collect do |l|
        student_hash[:twitter] = l.css('a')['href']
        student_hash[:linkedin] = l.css('div.social-icon-container').css('a')['href']
        student_hash[:github] = l.css('div.social-icon-container').css('a')['href']
        student_hash[:blog] = l.css('div.social-icon-container').css('a')['href']


          # student_hash[:profile_quote] = l.css('div.profile-quote')
          # student_hash[:bio] = l.css('div.description-holder').css('p')
      end
    student_hash
  end

end
