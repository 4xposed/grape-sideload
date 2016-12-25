require "spec_helper"

class Dummy
  include Grape::Sideload

  def self.present(*args)
    present(*args)
  end

  def present(content, with:)
    hash = {}
    hash[with.to_sym] = content
    hash[:api_version] = '1'
    hash
  end
end

describe Grape::Sideload do
  let(:dummy_class) { Dummy }
  let(:route) { dummy_class.new }

  it "has a version number" do
    expect(Grape::Sideload::VERSION).not_to be nil
  end

  describe "#merge_payloads" do
    let(:presented1) { { fruits: [], api_version: '1' } }
    let(:presented2) { { animals: [], api_version: '1' } }


    let(:expected_result) { { fruits: [], animals: [], api_version: '1' } }

    it "merges hashes built by Grape::Endpoint#present" do
      response = route.merge_payloads presented1, presented2

      expect(response).to eq(expected_result)
    end
  end

  describe "#present_many" do
    it "presents the resources witht he entities especified and merges them" do
      response = route.present_many(
        {
          present: [],
          with: 'fruits'
        },
        {
          present: [],
          with: 'animals'
        }
      )

      expect(response).to eq({
        animals: [],
        fruits: [],
        api_version: '1'
      })
    end
  end

end
