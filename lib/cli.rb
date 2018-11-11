require_relative 'euler31'

require 'pp'

module Euler31
    def self.usage
        puts 'Usage: euler31 -t | <n>'
        exit 0
    end

    def self.test
        raise unless change(ENGLISH_COINS, 1) == Set.new([Multiset.new([1])])
        raise unless change(ENGLISH_COINS, 2) == Set.new([Multiset.new([2]), Multiset.new([1, 1])])
        raise unless change(ENGLISH_COINS, 3) == Set.new([Multiset.new([2, 1]), Multiset.new([1, 1, 1])])

        puts 'Passed all tests'
    end

    def self.main
        if ARGV.length < 1
            usage
        end

        if ARGV[0] == '-t'
            test
        else
            n = ARGV[0].to_i
            combinations = change ENGLISH_COINS, n
            puts combinations.length
        end
    end
end
