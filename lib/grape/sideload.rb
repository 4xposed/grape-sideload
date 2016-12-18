require 'grape'
require "grape/sideload/version"
require "grape/sideload/merge_payloads"

module Grape
  module Sideload
    def present_many(*args)

    end

    def merge_payloads(*args)
      MergePayloads(*args)
    end
  end
end

Grape::Endpoint.send :include, Grape::Sideload
