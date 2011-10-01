task :scrape_snow_removal => :environment do
  puts "Start scraping streetnames and planned events"
  snowRemoval = SnowRemoval.new()
  snowRemoval.screenscrape_new_data()
  puts "Finished scraping streetnames and planned events."
end

task :set_locations  => :environment do
  puts "Start setting locations and spelling for streets"
  Street.all.each do |street|
    if(not(street.lat))
      begin
        street.set_locations("Oslo") # Add ', Oslo' to search string sendt to Google API
        street.save
      rescue Exception => e
        puts "  Error: " + e.to_s
        # exit
      end
    else
      puts "Ignoring street with location : " + street.streetname
    end
  end
end

task :remove_all_events => :environment do
  PlannedEvent.delete_all
  Street.delete_all
end

# Task exectued once every night
task :cron  => :environment do
end
