require 'merge_payloads'
module Grape
  module Sideload
    module PresentMany
      def merge_presenters(*input)
        @input = input
        merged_payload
      end

      private
      attr_reader :input

      def merged_payload
        MergePayloads.(*presented)
      end

      def presented
        # call #present on Grape::API to format the resoruces using the entity passed by the user
        input.map do |payload|
          self.present(
            payload[:present],
            with: payload[:with]
          )
        end
      end
    end
  end
end
