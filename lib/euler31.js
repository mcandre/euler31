var Bag = require('bag').Bag;

var ENGLISH_COINS = [
  1,
  2,
  5,
  10,
  20,
  50,
  100,
  200
];

exports.ENGLISH_COINS = ENGLISH_COINS;

// Return all possible combinations
// of the given coin types
// that sum to a certain value
function change(coins, value) {
  // console.log('Value: ', value);

  var combinations = new Bag();

  for (var i = 0; i < coins.length; i++) {
    var candidate = coins[i];

    // console.log('Evaluating candidate: ', candidate);

    var difference = value - candidate;

    if (difference === 0) {
      // console.log('Exact match: ', candidate);

      var b = new Bag();
      b.add(candidate);
      combinations.add(b);
    } else if (difference > 0) {
      // console.log('Possible match: ', candidate);

      combinations.add(product(candidate, change(coins.filter(function (coin) { return coin <= difference; }), difference)));
    }
  }

  return combinations;
}

exports.change = change;

// Given an atom and a collection,
// Return a collection with the atom included in each member
function product(coin, combinations) {
  var supercombinations = new Bag();

  combinations.forEach(function (combination) {
    var supercombination = new Bag();
    supercombination.addAll(combination);
    supercombination.add(coin);

    supercombinations.add(supercombination);
  });

  return supercombinations;
}
