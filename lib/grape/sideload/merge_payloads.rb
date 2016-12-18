module Grape
  module Sideload
    class MergePayloads
      def initialize(input)
        @input = input
      end

      def self.call(*input)
        new(input).merge_payloads
      end

      def merge_payloads
        merged_payloads
      end

      private
      attr_reader :input

      def merged_payloads
        input.reduce({}, :merge)
      end
    end
  end
end
