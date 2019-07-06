var Hamming = {};

Hamming.compute = function (strandA, strandB) {
	var i, len, accumulator = 0;
	if (strandA.length === strandB.length) {
		len = strandA.length;
	} else {
		throw 'DNA strands must be of equal length.';
	}
	for (i = 0; i < len; i++) {
		if (strandA[i] !== strandB[i]) {
			accumulator += 1;
		}
	}
	return accumulator;
};

module.exports = Hamming;