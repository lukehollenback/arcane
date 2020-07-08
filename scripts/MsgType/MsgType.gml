///
/// @desc Constructs a new message type struct holding its coercer function and
///       metadata.
/// @param {string}   key         The name of the represented message type.
/// @param {function} coercer     A function that takes one parameter – the generic data payload
///                               struct of a message – and can return a specific struct
///                               representing said payload.
/// @param {boolean} requiresAuth Whether or not the represented message type requires the client
///                               to be authenticated prior to it's messages being handled.
///
///
function MsgType(key, coercer, requiresAuth) constructor {
	
	Key = key
	Coercer = coercer
	RequiresAuth = requiresAuth
	
}