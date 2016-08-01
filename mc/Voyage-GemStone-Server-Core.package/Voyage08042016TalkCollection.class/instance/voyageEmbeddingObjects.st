examples
voyageEmbeddingObjects
  ^ '"Objects can be as simple as associations of literals or more complex: 
objects can contain other objects, leading to a tree of objects. Saving 
such objects is as simple as sending the save message to them. For example, 
let’s say that we want to create an Association of two points. As before we 
need to make sure that instances of Assocations are treated as a root object
by Voyage:

	Association class>>isVoyageRoot
		^ true"

assoc := 42@1 -> (10@20).
assoc save.

The association looks like the following when stored in GemStone:

	(class)@     -> TugrikObject
	(oop)@       -> 670637825
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579fc6f8391d54a8435b1635)
	_oidValue@   -> 27118354667247424203703129653
	#instanceOf@ -> #''Association''
	#version@    -> 1660957928
	key@         -> aDictionary( #''y''->1, ''#instanceOf''->#''Point'', #''x''->42)
	value@       -> aDictionary( #''y''->20, ''#instanceOf''->#''Point'', #''x''->10)

Note that each Point is represented by a Dictionary with x and y fields and #instanceOf Point.
'