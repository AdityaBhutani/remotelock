# frozen_string_literal: true

class RowsNormalizer
  CITY_CODES = {
    'LA' => 'Los Angeles',
    'NYC' => 'New York City'
  }.freeze
  attr_reader :header, :row, :separator

  def self.normalize_rows(header, rows, separator)
    rows.map { |row| new(header, row, separator).normalize }
  end

  def initialize(header, row, separator)
    @header = header
    @row = row
    @separator = separator
  end

  def normalize
    "#{first_name}, #{city}, #{birthdate}"
  end

  private

  def first_name
    index = header.index('first_name')
    row[index]
  end

  def city
    index = header.index('city')
    CITY_CODES.fetch(row[index], row[index])
  end

  def birthdate
    index = header.index('birthdate')
    row[index]
  end
end
