examples
voyageEmbeddingObjects
  ^ '"Objects can be as simple as associations of literals or more complex: objects can contain other objects, leading to a tree of objects. Saving such objects is as simple as sending the save message to them. For example, letâs say that we want to add a pet to the VOPilot object:"

pilot := VOTestPilot new
	name: ''Dale'';
	pet: (VOTestNonRootCat new
		name: ''Bond'';
		yourself);
	yourself.
pilot save.

"The pilot with embedded object looks like the following when stored in GemStone:

	(class)@           -> TugrikObject
	(oop)@             -> 673601537
	(invariant)@       -> true
	(committed)@       -> true
	_id@               -> OID(579fdf6a96240ba54f08945d)
	_oidValue@         -> 27118470113675083771403605085
	#instanceOf@       -> #''VOTestPilot''
	#version@          -> 2622850988
	name@              -> ''Dale''
	pet@               -> aDictionary(
 							#''name''->''Bond'', 
							''#instanceOf''->#''VOTestNonRootCat'')

Note that the VOTestNonRootCat is represented by a Dictionary with a name field."
'