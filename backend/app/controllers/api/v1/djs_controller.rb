module Api
  module V1
    class Api::V1::DjsController < ApplicationController
      def index
          @dj = Dj.all
          render json: @dj
      end
    end
  end
end