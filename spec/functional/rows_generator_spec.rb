# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RowsGenerator do
  context 'generates rows' do
    it 'separates people by dollar text and' do
      text = "city $ birthdate $ last_name $ first_name\nLA $ 30-4-1974 $ Nolan $ Rhiannon\nNYC $ 5-1-1962 $ Bruen $ Rigoberto\n"
      separator = '$'
      result = described_class.generate(text, separator)
      expect(result[0]).to eq(%w[city birthdate last_name first_name])
      expect(result[1]).to eq([['LA', '30-4-1974', 'Nolan', 'Rhiannon'], ['NYC', '5-1-1962', 'Bruen', 'Rigoberto']])
    end

    it 'separates people by dollar text' do
      text = "city % birthdate % last_name % first_name\nLA % 30-4-1974 % Nolan % Rhiannon\nNYC % 5-1-1962 % Bruen % Rigoberto\n"
      separator = '%'
      result = described_class.generate(text, separator)
      expect(result[0]).to eq(%w[city birthdate last_name first_name])
      expect(result[1]).to eq([['LA', '30-4-1974', 'Nolan', 'Rhiannon'], ['NYC', '5-1-1962', 'Bruen', 'Rigoberto']])
    end
  end
end
