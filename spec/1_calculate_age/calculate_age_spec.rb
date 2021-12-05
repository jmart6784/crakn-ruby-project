require 'date'
require 'spec_helper'
require_relative '../../lib/1_calculate_age/calculate_age'

RSpec.describe CalculateAge do
  subject(:helper) { described_class }

  context 'with age 01/21/1994 to 06/01/2021' do
    it 'equals 27' do
      expect(helper.calculate(Date.new(1994, 1, 21), Date.new(2021, 6, 1))).to eq 27
    end
  end

  context 'with age 08/20/1989 to 06/01/2021' do
    it 'equals 31' do
      expect(helper.calculate(Date.new(1989, 8, 20), Date.new(2021, 6, 1))).to eq 31
    end
  end
end
