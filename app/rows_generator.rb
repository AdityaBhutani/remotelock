# frozen_string_literal: true

class RowsGenerator
  def self.generate(text, separator)
    raise 'Text not provided' unless text

    all_rows = text.split("\n").map { |row| row.split(" #{separator} ") }
    header = all_rows.first
    rows = all_rows[1..]
    [header, rows, separator]
  end
end
