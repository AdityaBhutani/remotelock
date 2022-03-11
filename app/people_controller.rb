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
    RowsGenerator.generate(params[:dollar_format], '$')
  end
end
