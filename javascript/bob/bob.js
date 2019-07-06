var Bob = function() {};

Bob.prototype.hey = function(input) {

	var noLowerCase, anyUpperCase, isSilence, isYelling, isQuestion;

	noLowerCase = function (str) {
		var i, char, len = str.length;
		for (i = 0; i < len; i++) {
			char = str[i];
			if (char.toUpperCase() !== char) {
				return false;
			}
		}
		return true;
	};

	anyUpperCase = function (str) {
		var i, char, len = str.length;
		for (i = 0; i < len; i++) {
			char = str[i];
			if (char.toLowerCase() !== char) {
				return true;
			}
		}
		return false;
	};

	isSilence = function (str) {
		if (str.match(/\S/)) {
			return false;
		}
		return true;
	};

	isYelling = function (str) {
		if (noLowerCase(str) && anyUpperCase(str)) {
			return true;
		}
		return false;
	};

	isQuestion = function (str) {
		if (str.length > 0 && str[str.length - 1] === '?') {
			return true;
		}
		return false;
	};

	if (isSilence(input)) {
		return 'Fine. Be that way!';
	} else if (isYelling(input)) {
		return 'Whoa, chill out!';
	} else if (isQuestion(input)) {
		return 'Sure.'
	}

	return 'Whatever.';

};

module.exports = Bob;
