
var Words = function(str) {
	var counts = {};
	var words = str.split(/\s+/);
	words.forEach(function(word) {
		if (counts.hasOwnProperty(word)) {
			counts[word] += 1;
		} else {
			counts[word] = 1;
		}
	});
	return counts;
};

module.exports = Words;