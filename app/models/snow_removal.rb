class SnowRemoval < ActiveRecord::Base

  def screenscrape_new_data

    url = "http://www.samferdselsetaten.oslo.kommune.no/vei_og_trafikk/broyting_og_bortkjoring/oversikt_bortkjoring_av_sno/"
    doc = Nokogiri::HTML(open(url))
    
  end
end
