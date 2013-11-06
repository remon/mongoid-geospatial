require 'geo_ruby'
require 'mongoid_geospatial/extensions/georuby_point'

module Mongoid
  module Geospatial

    class Point
      delegate :distance, :to => :to_geo

      def to_geo
        GeoRuby::SimpleFeatures::Point.xy(x, y)
      end

      def geo_distance other
        to_geo.spherical_distance(other.to_geo)
      end

    end

    class Line < GeometryField

      def to_geo
        GeoRuby::SimpleFeatures::LineString.from_coordinates(self)
      end

    end

    class Polygon < GeometryField

      def to_geo
        GeoRuby::SimpleFeatures::Polygon.from_coordinates(self)
      end

    end
  end
end