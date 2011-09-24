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


      end
    end
    # street = Street.new(:streetname => "Teststreet")
    # street.save
    # event = PlannedEvent.new(:start_date => Time.now, :end_date => Time.now, :street => street, :comment => "Kommentaren")
    # event.save

  end

end
