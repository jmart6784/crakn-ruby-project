require 'spec_helper'
require_relative '../../lib/3_forgot_tests/journal'

RSpec.describe Journal do
  subject(:journal) { described_class }

  let(:debit1) { Journal::Line.new(10.0) }
  let(:debit2) { Journal::Line.new(6.0) }
  let(:credit1) { Journal::Line.new(8.0, debit: false) }

  describe '#total' do
    context 'with only debit lines' do
      let(:instance) { journal.new(debit1, debit2) }

      it 'returns the correct sum' do
        expect(instance.total).to eq 16.0
      end
    end
  end

  # Write some more specs anywhere in this File
end
