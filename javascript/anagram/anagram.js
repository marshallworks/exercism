var Anagram = function(base) {

	'use strict';

	var baseSorted,
		compareChar,
		sort,
		matches;

	compareChar = function(charA, charB) {
		// Ensure sort supports other languages.
		return charA.localeCompare(charB);
	};

	sort = function(string) {
		// Create an all lowercase array of characters from string.
		var charArray = string.toLowerCase().split('');

		charArray = charArray.sort(compareChar);

		return charArray.join('');
	};

	matches = function(possibleMatches) {
		var accumulator = [];

		// If first argument is not an Array, make an Array from the arguments.
		if (Object.prototype.toString.call(possibleMatches) !== '[object Array]') {
			possibleMatches = Array.prototype.slice.call(arguments);
		}

		// Get all matches that are not the string, but contain the same letters.
		possibleMatches.forEach(function(string) {
			if (string.toLowerCase() !== base && sort(string) === baseSorted) {
				accumulator.push(string);
			}
		});

		return accumulator;
	};

	// Set strings to compare against when matches are passed.
	base = base.toLowerCase();
	baseSorted = sort(base);

	// Return the matches method.
	return Object.freeze({
		matches: matches
	});
};

module.exports = Anagram;