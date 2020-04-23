/// @description Splits a given string into an array of segments by the specified delimiter.

var str = argument0
var delimiter = argument1
var nextSegIndex = 0
var nextSplitPos = string_pos(delimiter, str)
var segs;

while (nextSplitPos != 0) {
	segs[nextSegIndex] = string_copy(str, 1, (nextSplitPos - 1))
	str = string_delete(str, 1, nextSplitPos)
	nextSplitPos = string_pos(delimiter, str)
	nextSegIndex++
}

if (string_length(str) > 0) {
	segs[nextSegIndex] = str	
}

return segs