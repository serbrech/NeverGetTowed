class SnowRemoval < ActiveRecord::Base

  def screenscrape_new_data
    url = "http://www.samferdselsetaten.oslo.kommune.no/" +
          "vei_og_trafikk/broyting_og_bortkjoring/oversikt_bortkjoring_av_sno/"
    doc = Nokogiri::HTML(open(url))

    doc.css("table[width='729'] tr")[1..9999].each do |row_element|
      if(row_element.css("td").size > 1)
        streetname = row_element.css("td")[0].text
        comment    = row_element.css("td")[1].text
        date       = row_element.css("td")[2].text
        interval   = row_element.css("td")[3].text

        # Don't bother parsing dates and times for now
        start_time = Time.new(2011, 10, 20, 13, 30, 0, "+01:00")
        end_time = Time.new(2011, 10, 20, 13, 30, 0, "+01:00")
        # street = Street.new(:streetname => "Teststreet")

      end
    end

    # street.save
    # event = PlannedEvent.new(:start_date => Time.now, :end_date => Time.now, :street => street, :comment => "Kommentaren")
    # event.save
  end

  def self.streetname_spellchecker(scraped_streetname)
    url = "https://maps.googleapis.com/maps/api/place/search/json?"
    lat = 59.925152
    lng = 10.725403
    radius = 300
    urlparam = {
            'location' => "#{lat},#{lng}",
            'radius' => radius,
            'sensor' => "true",
            'types'  => 'parking|locality|street_address',
            'key'    =>  'AIzaSyCsFYnFa6YfocJSIsr4dUm9eJRStVfRNSM'
    }
    # completeurl = url + "".join([ "&%s=%s" % (key, val) for key, val in urlparam.items() ])[1:]
    # complete_url = url + urlparam.join("=")
    completeurl = url
    urlparam.each do |key,val|
      completeurl += "#{key}=#{val.to_s}&"
    end
    content = open(completeurl).read
    puts content

  end

end
