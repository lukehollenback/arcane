///
/// @description Finds the position of the first occurrence of one of the provided substrings in the
///  provided string.
///
/// substrs {number} A reference to an array of substrings to search for.
/// str     {string} The string to search in.
///
/// @return {number} A reference to an array where the first element is the position of the first
///  occurence of any of the provided substrings – or 0 if no occurrences were found – and the
///  second element is the actual substring that was found.
///

var substrs = argument0
var str = argument1

//
// Find the earliest substring in the provided string.
//
var bestPos = 0;
var bestSubstr = ""

for (var i = (array_length_1d(substrs) - 1); i > -1; i--) {
	var substrPos = string_pos(substrs[i], str)
	
	if (substrPos != 0 && (substrPos < bestPos || bestPos == 0)) {
		bestPos = substrPos	
		bestSubstr = substrs[i]
	}
}

//
// Build and return the tuple.
//
var retVal = array_create(2)

retVal[0] = bestPos
retVal[1] = bestSubstr

return retVal