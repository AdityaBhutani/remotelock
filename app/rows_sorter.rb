# frozen_string_literal: true

class RowsSorter
  REQUIRED_FIELDS = %w[first_name city birthdate].freeze

  def self.sort(rows, order = nil)
    return rows unless order

    rows.sort_by do |row|
      row.split(', ')[REQUIRED_FIELDS.index(order.to_s)]
    end
  end
end
