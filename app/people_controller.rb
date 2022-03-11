require_relative 'rows_generator'
require_relative 'rows_normalizer'
class PeopleController
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def normalize
    RowsNormalizer.normalize_rows(*RowsGenerator.generate(params[:dollar_format], '$'))
  end
end
