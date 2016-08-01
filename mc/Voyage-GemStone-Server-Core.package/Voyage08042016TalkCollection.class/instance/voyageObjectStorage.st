examples
voyageObjectStorage
  ^ '"To store objects, the class of the object must be declard as a 
`root of the repository`. All repository roots are points of entry to 
the database. Voyage stores more than just objects that contain literals. 
Complete trees of objects can be stored with Voyage as well, and this 
is done transparently.

To store an Association you need to implement #isVoyageRoot on the 
class-side to declare instances of given class as Voyage roots:

	Association class>>isVoyageRoot
		^ true

To save an association you just need to use the #save message"

anAssociation := #answer->42.
anAssociation save

"The following object is stored in the GemStone database (most of these are 
dynamic instance variables -- _id and _oidValue are not):

	(class)@     -> TugrikObject
	(oop)@       -> 670424833
	(invariant)@ -> true
	(committed)@ -> true
	_id@         -> OID(579f9e28439f559239901906)
	_oidValue@   -> 27118161936422510778517559558
	#instanceOf@ -> #''Association''
	#version@    -> 2178500417
	key@         -> #''answer''
	value@       -> 42

This is the document that is stored in a MongoDB database:

	{
	""_id"" : ObjectId(""579f9e28439f559239901906""),
	""#instanceOf"" : ""Association"",
	""#version"" : NumberLong(""2178500417""),
	""key"" : ''answer'',
	""value"" : 42
	}
	"
'