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
  console.log('Value: ', value);

  var combinations = new Set();

  for (var i = 0; i < coins.size; i++) {
    var candidate = coins[i];

    console.log('Evaluating candidate: ', candidate);

    if (value - candidate === 0) {
      console.log('Exact match: ', candidate);

      combinations.add(candidate);
    } else if (value - candidate > 0) {
      console.log('Possible match: ', candidate);

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

  for (var combination of combinations.keys()) {
    var supercombination = new Set(combination);
    supercombination.add(coin);

    supercombinations.add(supercombination);
  }

  return supercombinations;
}
