class MovieCountriesController < ApplicationController
  before_action :set_movie_country, only: [:show]
  after_action :verify_authorized

  # GET /movie_countries
  # GET /movie_countries.json
  def index
    @movie_countries = MovieCountry.select("country_code").distinct
    authorize @movie_countries
  end

  # GET /movie_countries/1
  # GET /movie_countries/1.json
  def show
    authorize @movie_country
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_country
      @movie_country = MovieCountry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_country_params
      params.require(:movie_country).permit(:movie_id, :country_code)
    end
end
