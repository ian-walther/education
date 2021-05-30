require 'rails_helper'

RSpec.describe CollegeScorecardService do

  describe '.parse_schools_list' do
    let(:api_response) { IO.read(Rails.root.join('spec', 'fixtures', 'college_scorecard_response.json')) }
    let(:parsed_list) { ["Empire Beauty  School-Lehigh Valley", "Lehigh Carbon Community College", "Lehigh University", "Pennsylvania State University-Penn State Lehigh Valley", "Lehigh Valley Barber School"] }

    it 'parses the json response from the API and returns a list of the names of schools' do
      college_names = CollegeScorecardService.parse_schools_list api_response
      expect(college_names).to eql(parsed_list)
    end
  end

end