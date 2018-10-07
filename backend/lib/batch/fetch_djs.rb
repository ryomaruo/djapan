require 'mechanize'
require 'nokogiri'
require 'kconv'
require 'logger'

class Batch::FetchDjs
  attr_reader :logger
  attr_reader :index_url
  attr_reader :index_page
  ROOT_PATH = Rails.root.to_s

  def initialize
    init_logger
    init_index_page
  end
  
  def self.exec
    batch = new
    batch.logger.debug batch.inspect
    batch.fetchDjs
  end

  def fetchDjs
    @index_page.search('section.content div.plus8 a[href^="/dj/"]').each do |a|
      dj_name = a.text
      next if dj_name.empty?
      next if Dj.exists?(name: dj_name)
      Dj.create(name: dj_name);
      puts dj_name + "\n"
    end
  end

  def fetchDjs
    @index_page.search('section.content div.plus8 a[href^="/dj/"]').each do |a|
      href_str = a.attributes['href'].text
      each_dj_page = @index_page.link_with(href: href_str).click
      each_dj_page.search('article.event-item p.flag img').each do |flag_img|
        p flag_img.attributes['src'].value
      end
    end
  end

  def name
    self.class.name
  end

  private

  def init_logger
    log_path = File.join(ROOT_PATH, '/log/')
    log_name = File.join(log_path, "#{name}.log")
    @logger = Logger.new(log_name, 3)
  end

  def init_index_page
    agent = Mechanize.new
    agent.user_agent = 'Mac Safari'
    index_url = 'https://jp.residentadvisor.net/dj.aspx'
    @index_page = agent.get(index_url)
  end
end