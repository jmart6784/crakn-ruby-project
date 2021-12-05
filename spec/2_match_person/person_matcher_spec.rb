require 'spec_helper'
require_relative '../../lib/2_match_person/person_matcher'

RSpec.describe PersonMatcher do
  subject(:matcher) { described_class }

  let(:dwight1) { { first_name: 'Dwight', middle_name: 'Glenn', last_name: 'Appleton' } }
  let(:dwight2) { { first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton' } }
  let(:autumn) { { first_name: 'Autumn', middle_name: 'Harley', last_name: 'Poole' } }
  let(:noah) { { first_name: 'Noah', middle_name: 'Zaire', last_name: 'Waters' } }

  let(:people) { [dwight1, dwight2, autumn, noah] }
  let(:instance) { matcher.new(*people) }

  context 'with Dwight Appleton' do
    let(:matches) { instance.find_match(first_name: 'Dwight', last_name: 'Appleton') }

    it 'matches both Dwights' do
      expect(matches).to include(dwight1, dwight2)
      expect(matches).not_to include(autumn, noah)
    end
  end

  context 'with Dwight Gerald Appleton' do
    let(:matches) { instance.find_match(first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton') }

    it 'matches exactly' do
      expect(matches).to include(dwight2)
      expect(matches).not_to include(autumn, noah, dwight1)
    end
  end
end
