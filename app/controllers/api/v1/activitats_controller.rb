module Api
  module V1
    class ActivitatsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      before_action :set_activitat, only: [:show]

      # GET /activitats
      def index
        @activitats = Activitat.all

        respond_to do |format|
          if @activitats
            format.json { render :json => @activitats.as_json }
          else
            format.json { render json: { error: @activitats.error, status:404 }, status: 404  }
          end
        end

      end
      # GET /activitats/1
      # GET /activitats/1.json
      def show
        respond_to do |format|
          format.json { render :json => @activitat.as_json }
        end
      end
      # curl -H "Content-Type: application/json" -X POST -d '{"lat":"40.619748", "long":"0.592511"}'
      # http://localhost:3000/api/v1/activitats/activitats_by_distance
      def activitats_by_distance
        # from @lat and @long get the closest @activitat
        activitats = Activitat.all
        activitat_origin = Activitat.new({lat: params[:lat], long: params[:long]})

        #
        activitats.each do |act|
          act.dist = calculate_dist(activitat_origin, act, 'km')
        end

        respond_to do |format|
          format.json { render :json => activitats.as_json}
        end

      end
      # curl -H "Content-Type: application/json" -X POST -d '{"lat":"40.619748", "long":"0.592511"}'
      # http://localhost:3000/api/v1/activitats/get_closest_ruta
      def get_closest_ruta

        # from @lat and @long get the closest @activitat
        activitats = Activitat.all
        closest_ruta = nil
        activitat_origin = Activitat.new({lat: params[:lat], long: params[:long]})
        min_dist = 9999

        #
        activitats.each do |act|
          dist = calculate_dist(activitat_origin, act, 'km')
          # puts dist
          if dist < min_dist
            closest_ruta = act
            min_dist = dist
          end
        end

        respond_to do |format|
          if closest_ruta
            closest_ruta.dist = min_dist
            puts closest_ruta.as_json
            format.json { render :json =>closest_ruta.as_json}
          else
            format.json { render json: { error: 'cap ruta trobada :(', status:404 }, status: 404  }
          end
        end

      end

      private
      # origin and destination have two fields, lat and long
      def calculate_dist(origin, destination, unit)

        if unit == 'km'
          earth = 6371
        else
            earth = 3960
        end

        # From co-ordinates
        lat1 = deg2rad(origin.lat)
        long1 = deg2rad(origin.long)

        # To co-ordinates
        lat2 = deg2rad(destination.lat)
        long2= deg2rad(destination.long)

        # The Haversine Formula
        dlong=long2-long1
        dlat=lat2-lat1

        sinlat=Math.sin(dlat/2)
        sinlong=Math.sin(dlong/2)

        a=(sinlat*sinlat)+Math.cos(lat1)*Math.cos(lat2)*(sinlong*sinlong)

        c=2*Math.asin(Math.sqrt(a))

        # dist = (earth*c)

        # if less than 2km return in meters else return in km
        # if dist < 2
        #   dist = (dist * 1000).round(0)
        # else
        #   dist = dist.round(1)
        # end

        return (earth*c*1000).round(0)
      end
      def rad2deg(rad)
        rad / Math::PI * 180.0
      end
      def deg2rad(deg)
        deg / 180.0 * Math::PI
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_activitat
        @activitat = Activitat.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def activitat_params
        params.require(:activitat).permit(:titol, :subtitol, :descripcio, :lat, :long, :user_id, :cover, :puesto)
      end

    end
  end
end

