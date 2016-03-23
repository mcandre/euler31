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

      exact_change = candidates.bsearch { |coin| coin == value }

      exact_change_array = if exact_change
                           [Multiset.new([exact_change])]
                         else
                           []
                         end

      exact_change_set = Set.new(exact_change_array)

      remaining_candidates = candidates - [exact_change]

      non_trivial_factors = remaining_candidates.collect do |candidate|
        ch = change(remaining_candidates, value - candidate)

        if ch.size == 0
          nil
        else
          ch.collect { |factors| factors.dup << candidate }.uniq
        end
      end

      non_nil_non_trivial_factors = non_trivial_factors.flatten.compact

      unique_non_nil_non_trivial_factors = Set.new(non_nil_non_trivial_factors)

      @memo[key] = exact_change_set | unique_non_nil_non_trivial_factors
    end
  end
end
