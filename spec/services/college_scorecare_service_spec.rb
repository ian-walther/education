require 'rails_helper'

RSpec.describe CollegeScorecardService do

  describe '.parse_schools_list' do
    let(:api_response) { IO.read(Rails.root.join('spec', 'fixtures', 'college_scorecard_response.json')) }
    let(:parsed_data) {
      [
        {:name=>"Empire Beauty  School-Lehigh Valley", :location=>{:lat=>40.63006, :lng=>-75.485471}},
        {:name=>"Lehigh Carbon Community College", :location=>{:lat=>40.66474, :lng=>-75.610715}},
        {:name=>"Lehigh University", :location=>{:lat=>40.606822, :lng=>-75.380236}},
        {:name=>"Pennsylvania State University-Penn State Lehigh Valley", :location=>{:lat=>40.559208, :lng=>-75.402507}},
        {:name=>"Lehigh Valley Barber School", :location=>{:lat=>40.639992, :lng=>-75.346918}}
      ]
    }

    it 'parses the json response from the API and returns a list of the names of schools' do
      college_names_and_locations = CollegeScorecardService.parse_schools_list api_response
      expect(college_names_and_locations).to eql(parsed_data)
    end
  end

end