class CollegeScorecardService

  def self.get_schools_list(search_query)
    schools_json = schools_request search_query
    parse_schools_list schools_json
  end

  def self.parse_schools_list(schools_json)
    JSON.parse(schools_json)['results'].map do |result|
      {
        name: result['school']['name'],
        location: {
          lat: result['location']['lat'],
          lng: result['location']['lon']
        }
      }
    end
  end

  def self.schools_request(search_query)
    RestClient.get(
      'https://api.data.gov/ed/collegescorecard/v1/schools.json',
      params: {
        'api_key': 'uhXCcDwgtyefUANYRhw4AHXCE403Nis9eaDRY4En', #TODO: this was hardcoded for simplicity, best practice would have this be passed in as an env var
        'school.name': search_query.to_s
      }
    )
  end

end