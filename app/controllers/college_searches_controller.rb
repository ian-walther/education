class CollegeSearchesController < ApplicationController

  def index
  end

  def college_list
    respond_to do |format|
      format.json {
        render json: CollegeScorecardService.get_schools_list(params[:school_name])
      }
    end
  end

end