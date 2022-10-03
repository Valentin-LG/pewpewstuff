class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  CATEGORIES = [:aeg, :gbbr, :aep, :gbb, :spring]
  MATERIALS = [:aluminium, :metal, :plastic, :abs, :laiton, :inox, :polymer]
end
