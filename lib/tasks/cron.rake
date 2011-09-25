task :scrape_snow_removal  => :environment do
  puts "Scraping streetnames and planned events"
  snowRemoval = SnowRemoval.new()
  snowRemoval.screenscrape_new_data()
  puts "Finished scraping."
end

task :cron  => :environment do
end
