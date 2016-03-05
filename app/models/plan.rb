class Plan < ActiveRecord::Base
  has_many :consumption_rates
  has_many :time_ranges
end
