'use strict';

var ENGLISH_COINS = [
  200,
  100,
  50,
  20,
  10,
  5,
  2,
  1
];

exports.ENGLISH_COINS = ENGLISH_COINS;

// Return all possible combinations
// of the given coin types
// that sum to a certain value
function change(coins, value) {
  var combinations = new Set();

  for (var i = 0; i < coins.length; i++) {
    var candidate = coins[i];

    if (value - candidate === 0) {
      combinations.add(candidate);
    } else if (value - candidate > 0) {
      combinations.add(product(candidate, change(coins.filter(function (coin) { return coin <= candidate; }), value - candidate)));
    }
  }

  return combinations;
}

exports.change = change;

// Given an atom and a collection,
// Return a collection with the atom included in each member
function product(coin, combinations) {
  var supercombinations = new Set();

  for (var i = 0; i < combinations.length; i++) {
    var combination = combinations[i];
    var supercombination = new Set(combination);
    supercombination.add(coin);

    supercombinations.add(supercombination);
  }

  return supercombinations;
}
