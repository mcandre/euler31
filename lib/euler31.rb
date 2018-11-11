require 'set'
require 'multiset'

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

    def self._change(coins, value)
        exact_change, candidates = coins.partition { |coin| coin == value }

        leftover_candidates = candidates.select { |coin| coin <= value }


        exact_change_array = if exact_change.length > 0
            [Multiset.new([exact_change.first])]
        else
            []
        end

        non_trivial_factors = Set.new

        leftover_candidates.each do |candidate|
            diff = value - candidate
            remaining_candidates = leftover_candidates.select { |c| c <= diff }
            ch = change(remaining_candidates, diff)

            ch.each do |factors|
                non_trivial_factors << (factors.dup << candidate)
            end
        end

        Set.new(exact_change_array) | non_trivial_factors
    end

    # Memoized
    def self.change(coins, value)
        if @memo.has_key?(value)
            @memo[value]
        else
            @memo[value] = _change(coins, value)
        end
    end
end
