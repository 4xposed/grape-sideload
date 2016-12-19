require 'grape'
require "grape/sideload/version"
require "grape/sideload/merge_payloads"
require "grape/sideload/present_many"

module Grape
  module Sideload
    def merge_payloads(*args)
      MergePayloads.(*args)
    end

    def present_many(*args)
      PresentMany.(*args)
    end
  end
end

Grape::Endpoint.send :include, Grape::Sideload
