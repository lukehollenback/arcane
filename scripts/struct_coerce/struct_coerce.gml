///
/// @desc               Takes the members of a generic struct instance (e.g. created via the SNAP
///                     library) and coerces them into a specific struct instance (which might also
///                     provided methods and so on to use against said members).
/// @param {index} from Reference to an instance of a generic struct from which members should be
///                     coerced.
/// @param {index} to   Reference to an instance of a specific struct into which members should be
///                     coerced.
///
function struct_coerce(from, to) {
	
	var members = variable_struct_get_names(from);
	
	for (var i = 0; i < array_length(members); i++) {
		var member = members[i]
		var val = variable_struct_get(from, member)
		
		variable_struct_set(to, member, val)
	}

}