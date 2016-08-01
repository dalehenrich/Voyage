examples
voyageReferencingRoots
  ^ '"Sometimes the objects are trees that contain other root objects. 
If the embedded objects (the roles) are root objects, Voyage will 
store references to these objects instead of including them in the document.
After we add #isVoyageRoot to the Point class:

	Point class>>isVoyageRoot
		^ true

 and save the association"

assoc := 42@1 -> (10@20).
assoc save.

"The stored association looks like the following in GemStone:

	(class)@     -> TugrikObject
	(oop)@       -> 672841473
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579fca32391d54c1da5b1649)
	_oidValue@   -> 27118369904258029197700306505
	#instanceOf@ -> #''Association''
	#version@    -> 3052998645
	key@         -> aDictionary( ''#collection''->#''Point'', ''#instanceOf''->''Point'', 
					''__id''->OID(579fca32391d54c1da5b164a))
	value@       -> aDictionary( ''#collection''->#''Point'', ''#instanceOf''->''Point'', 					''__id''->OID(579fca32391d54c1da5b164b))

along with the following two Point objects:

	(class)@     -> TugrikObject
	(oop)@       -> 672678657
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579fca32391d54c1da5b164a)
	_oidValue@   -> 27118369904258029197700306506
	#instanceOf@ -> #''Point''
	#version@    -> 2376436083
	x@           -> 42
	y@           -> 1

	(class)@     -> TugrikObject
	(oop)@       -> 672673025
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579fca32391d54c1da5b164b)
	_oidValue@   -> 27118369904258029197700306507
	#instanceOf@ -> #''Point''
	#version@    -> 3468240979
	x@           -> 10
	y@           -> 20

"
'