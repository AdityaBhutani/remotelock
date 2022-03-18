# frozen_string_literal: true

class RowsSorter
  REQUIRED_FIELDS = %w[first_name city birthdate].freeze
  attr_reader :row, :order

  def self.sort(rows, order = nil)
    return rows unless order

    rows.sort_by do |row|
      new(row, order).choose_sorting(row, order)
    end
  end

  def initialize(row, order)
    @row = row
    @order = order
  end

  def choose_sorting(row, order)
    case order.to_s
    when 'birthdate'
      date_array = row.split(', ')[REQUIRED_FIELDS.index(order.to_s)].split('/').map(&:to_i)
      Time.new(date_array[2], date_array[0], date_array[1])
    else
      row.split(', ')[REQUIRED_FIELDS.index(order.to_s)]
    end
  end
end
