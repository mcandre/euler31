"use strict";

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
    var coin = coins[i];

    // ...
  }

  return combinations;
}

exports.change = change;
