examples
voyageReferencingRoots
  ^ '"Sometimes the objects are trees that contain other root objects. 
If the embedded objects are root objects, Voyage will store references to 
these objects instead of including them in the document."

pilot := VOTestPilot new
	name: ''Dale'';
	pet: (VOTestCat new
		name: ''Bond'';
		yourself);
	yourself.
pilot save

"The stored pilot looks like the following in GemStone:

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
							''#collection''->''pet'',
							''#instanceOf''->''VOTestCat'',
							''__id''->OID(579fe37796240ba54f089473))

along with the following VOTestCat instance:

	(class)@     -> TugrikObject
	(oop)@       -> 675964673
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579fe37796240ba54f089473)
	_oidValue@   -> 27118489242948688208208630899
	#instanceOf@ -> #''VOTestCat''
	#version@    -> 2440839322
	name@        -> ''Bond''

"
'