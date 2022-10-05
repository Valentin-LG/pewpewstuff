# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  CATEGORIES = %i[aeg gbbr aep gbb spring].freeze
  MATERIALS = %i[aluminium metal plastic abs laiton inox polymer].freeze
end
