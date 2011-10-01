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



  # Sets location (geometric center), geometric boundaries and address components (locality names)
  # Uses Google Maps API
  def set_locations(city_name)
    puts "Set locations for '#{self.streetname}'"
    agent = Mechanize.new
    url = "https://maps.googleapis.com/maps/api/geocode/json?"
    page = agent.get(url, {
      'address' => self.streetname + ", #{city_name}",
      'sensor' => false,
      'region' => 'no',
      'key' => 'ABQIAAAAvHg26MXzCcZPHlKrGs_slBRqpojeccfxkLI5MIsXhsXwciLmMRQZ3GI66gNy6d8gdWqCH763g0mdEA'
    })
    data = JSON.parse(page.body)
    if(data["status"] == "OVER_QUERY_LIMIT")
      raise "OVER_QUERY_LIMIT"
    end
    result = data["results"].first
    if(data["results"].size > 1)
      if(data["results"][0]["geometry"]["location_type"] == "APPROXIMATE")
        raise "Unknown street name: " + self.streetname
      else
        raise "Unknown street name: " + self.streetname
      end
    end

    # Update misspelled streetnames
    begin
      google_streetname = result["address_components"][0]["long_name"]
    rescue
      raise "Unknown response: " + data.to_s
    end
    edit_distance = levenshtein(self.streetname,google_streetname)
    if(edit_distance > 0)
      if(edit_distance < 7)
        puts "  Warning: Updating streetname '#{self.streetname}' => '#{google_streetname}'"
        self.streetname = google_streetname
      else
        raise "Error: Not same street? '#{self.streetname}' => '#{google_streetname}'"
      end
    end

    self.northeast_lat = result["geometry"]["bounds"]["northeast"]["lat"]
    self.northeast_lng = result["geometry"]["bounds"]["northeast"]["lng"]
    self.southwest_lat = result["geometry"]["bounds"]["southwest"]["lat"]
    self.southwest_lng = result["geometry"]["bounds"]["southwest"]["lng"]
    self.lat = result["geometry"]["location"]["lat"]
    self.lng = result["geometry"]["location"]["lng"]

    # Add address components, like area name, to database for searching
    address_components = []
    result["address_components"].each do |address_component|
      address_components << address_component["long_name"]
    end
    self.address_components = address_components.join(", ")
  end

  # Simple implementation of the damerau levenshtein distance algortihm:
  def levenshtein(seq1, seq2)
    oneago = nil
    thisrow = (1..seq2.size).to_a + [0]
    seq1.size.times do |x|
        twoago, oneago, thisrow = oneago, thisrow, [0] * seq2.size + [x + 1]
        seq2.size.times do |y|
          delcost = oneago[y] + 1
          addcost = thisrow[y - 1] + 1
          subcost = oneago[y - 1] + ((seq1[x] != seq2[y]) ? 1 : 0)
          thisrow[y] = [delcost, addcost, subcost].min
          if (x > 0 and y > 0 and seq1[x] == seq2[y-1] and seq1[x-1] == seq2[y] and seq1[x] != seq2[y])
            thisrow[y] = [thisrow[y], twoago[y-2] + 1].min
          end
        end
      end
    return thisrow[seq2.size - 1]
  end

end
