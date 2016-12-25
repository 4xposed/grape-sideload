require_relative 'merge_payloads'
module Grape
  module Sideload
    class PresentMany
      def initialize(input, block)
        @input = input
        @block = block
      end

      def self.call(*input, block)
        new(input, block).merge_presenters
      end

      def merge_presenters
        merged_payload
      end

      private
      attr_reader :input, :block

      def merged_payload
        MergePayloads.(*presented)
      end

      def presented
        # call #present on Grape::API to format the resoruces using the entity passed by the user
        input.map do |payload|
          block.(
            payload[:present],
            with: payload[:with]
          )
        end
      end
    end
  end
end
