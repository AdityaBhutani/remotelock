# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RowsNormalizer do
  context 'generates normalized output for rows' do
    it 'normalizes rows in correct format' do
      header = %w[city birthdate last_name first_name]
      rows = [['LA', '30-4-1974', 'Nolan', 'Rhiannon'], ['NYC', '5-1-1962', 'Bruen', 'Rigoberto']]
      separator = '$'
      expect(described_class.normalize_rows(header, rows, separator)).to eq(
        [
          'Rhiannon, Los Angeles, 4/30/1974',
          'Rigoberto, New York City, 1/5/1962'
        ]
      )
    end
  end
end
