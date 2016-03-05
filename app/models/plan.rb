class Plan < ActiveRecord::Base
  has_many :consumption_rates, dependent: :destroy
  has_many :time_ranges, dependent: :destroy
end
