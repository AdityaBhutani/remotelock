# frozen_string_literal: true

require_relative 'rows_generator'
require_relative 'rows_normalizer'
require_relative 'rows_sorter'
class PeopleController
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def normalize
    rows = RowsNormalizer.normalize_rows(*RowsGenerator.generate(params[:dollar_format], '$')) +
           RowsNormalizer.normalize_rows(*RowsGenerator.generate(params[:percent_format], '%'))
    RowsSorter.sort(rows, params[:order])
  end
end
