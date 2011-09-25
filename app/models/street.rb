class Street < ActiveRecord::Base
  has_many :planned_events

  # http://wiki.openstreetmap.org/wiki/Nominatim#Reverse_Geocoding_.2F_Address_lookup
  def get_streetnames_osm(lat,lng,radius)
    agent = Mechanize.new
    agent.user_agent = 'Individual User-Agent'
    url = "http://nominatim.openstreetmap.org/reverse?"

    page = agent.get(url, {
      'format' => 'json',
      'lat' => lat,
      'lon' => lng,
      'zoom' => 18,
      'addressdetail' => 1
    })
    return page.body
  end

  def get_streetnames_for_location(lat,lng, radius)
    streetname = ""
    json = get_streetnames_osm(lat,lng,radius)
    data = JSON.parse(json)
    if(data["address"]["road"])
      streetname = data["address"]["road"]
    else
      streetname = data["address"]["suburb"]
    end
    return streetname
  end

end
