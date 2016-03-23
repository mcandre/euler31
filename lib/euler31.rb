require 'set'
require 'multiset'
require 'memist'

require_relative 'cli'

#
# Project Euler #31
#
module Euler31
  ENGLISH_COINS = [
    1,
    2,
    5,
    10,
    20,
    50,
    100,
    200
  ].freeze

  attr_accessor :memo

  @memo = {}

  def self.change(coins, value)
    key = [coins, value]

    if @memo.has_key?(key)
      @memo[key]
    else
      candidates = coins.select { |coin| value - coin >= 0 }

      key2 = [candidates, value]

      if @memo.has_key?(key2)
        @memo[key2]
      else
        exact_change, remaining_candidates = candidates.partition { |coin| coin == value }

        exact_change_array = if exact_change.length > 0
                             [Multiset.new([exact_change.first])]
                           else
                             []
                           end

        non_trivial_factors = Set.new

        remaining_candidates.each do |candidate|
          ch = change(remaining_candidates, value - candidate)

          ch.each do |factors|
            non_trivial_factors << (factors.dup << candidate)
          end
        end

        @memo[key2] = @memo[key] = Set.new(exact_change_array) | non_trivial_factors
      end
    end
  end
end
