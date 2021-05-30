class CollegeScorecardService

  def self.get_schools_list(search_query)
    schools_json = schools_request search_query
    parse_schools_list schools_json
  end

  def self.parse_schools_list(schools_json)
    JSON.parse(schools_json)['results'].map do |result|
      result['school']['name']
    end
  end

  def self.schools_request(search_query)
    RestClient.get(
      'https://api.data.gov/ed/collegescorecard/v1/schools.json',
      params: {
        'api_key': 'uhXCcDwgtyefUANYRhw4AHXCE403Nis9eaDRY4En',
        'school.name': search_query.to_s
      }
    )
  end

end