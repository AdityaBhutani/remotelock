# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RowsSorter do
  context 'sorts rows' do
    let(:rows) do
      [
        'Mckayla, Atlanta, 5/29/1986',
        'Elliot, New York City, 5/4/1947'
      ]
    end

    it 'sorts rows by first name' do
      order = :first_name
      expect(described_class.sort(rows, order)).to eq(
        ['Elliot, New York City, 5/4/1947',
         'Mckayla, Atlanta, 5/29/1986']
      )
    end

    it 'sorts rows by city' do
      order = :city
      expect(described_class.sort(rows, order)).to eq(
        ['Mckayla, Atlanta, 5/29/1986',
         'Elliot, New York City, 5/4/1947']
      )
    end

    it 'doesnt sort when no order given' do
      expect(described_class.sort(rows)).to eq(
        ['Mckayla, Atlanta, 5/29/1986',
         'Elliot, New York City, 5/4/1947']
      )
    end
  end
end
