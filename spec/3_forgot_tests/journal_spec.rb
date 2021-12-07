require 'spec_helper'
require_relative '../../lib/3_forgot_tests/journal'

RSpec.describe Journal do
  subject(:journal) { described_class }

  let(:debit1) { Journal::Line.new(10.0) }
  let(:debit2) { Journal::Line.new(6.0) }
  let(:debit3) { Journal::Line.new(4.0) }
  let(:debit4) { Journal::Line.new(20) }
  let(:credit1) { Journal::Line.new(8.0, debit: false) }
  let(:credit2) { Journal::Line.new(100.0, debit: false) }
  let(:credit3) { Journal::Line.new(20, debit: false) }

  describe '#total' do
    context 'with only debit lines' do
      let(:instance) { journal.new(debit1, debit2) }

      it 'returns the correct sum' do
        expect(instance.total).to eq 16.0
      end

      it '(debit value) total still increases with an integer rather than float' do
        instance.add(debit4)
        expect(instance.total).to eq 36.0
      end
    end

    context 'with credit lines' do
      let(:instance) { journal.new(debit1, debit2) }

      it 'subtracts from total when using credit' do
        instance.add(credit1)
        expect(instance.total).to eq 8.0
      end

      it 'returns a negative total when credit is a higher value than debit' do
        instance.add(credit2)
        expect(instance.total < 0).to eq true
      end

      it '(credit value) total still decreases with an integer rather than float' do
        instance.add(credit3)
        expect(instance.total).to eq -4.0
      end
    end
  end

  describe '#add(line)' do
    context 'adds a new line class to journal line array' do
      let(:journal_1) { journal.new(debit1, debit2) }

      it 'adds new line to journal array' do
        journal_1.add(debit3)
        expect(journal_1.lines[-1]).to eq debit3
      end

      it '.line returns an Array' do
        expect(journal_1.lines.class).to eq Array
      end
    end
  end

  describe 'Line class' do
    context '.debit' do
      let(:journal_1) { journal.new(debit1, debit2) }

      it 'debit returns true by default' do
        journal_1.add(debit3)
        expect(debit3.debit).to eq true
      end

      it 'credit 1 returns false when calling .debit' do
        expect(credit1.debit).to eq false
      end
    end

    context '.amount' do
      let(:journal_1) { journal.new(debit1, debit2) }

      it 'debit1 returns value of 10.0' do
        expect(debit1.amount).to eq 10.0
      end

      it 'debit1 is a float' do
        expect(debit1.amount.class).to eq Float
      end

      it 'debit4 is a integer' do
        expect(debit4.amount.class).to eq Integer
      end
    end
  end
end
