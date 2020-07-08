///
/// @desc                  Splits a given string into an array of segments by the specified
///                        delimiter.
/// @param {string} str    The string to split.
/// @param {string} delim  The single-character delimiter by which the string should be split.
///
function string_split(str, delim) {

	var nextSegIndex = 0
	var nextSplitPos = string_pos(delim, str)
	var segs;

	while (nextSplitPos != 0) {
		segs[nextSegIndex] = string_copy(str, 1, (nextSplitPos - 1))
		str = string_delete(str, 1, nextSplitPos)
		nextSplitPos = string_pos(delim, str)
		nextSegIndex++
	}

	if (string_length(str) > 0) {
		segs[nextSegIndex] = str	
	}

	return segs
	
}
