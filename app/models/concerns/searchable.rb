require 'elasticsearch/model'
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      # ...
    end

    def self.search(query)
      self.search("#{type}:#{query}")
    end
  end
end