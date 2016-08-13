examples
voyageObjectStorage
  ^ '"To store objects, the class of the object must be declard as a `root of the repository`. All repository roots are points of entry to the database. Voyage stores more than just objects that contain literals. Complete trees of objects can be stored with Voyage as well, and this is done transparently.

To store a VOTestPilot you need to implement #isVoyageRoot on the 
class-side to declare instances of given class as Voyage roots:

	VOTestPilot class>>isVoyageRoot
		^ true

To save a test pilot you just need to use the #save message"

pilot := VOTestPilot new
	name: ''Dale'';
	yourself.
pilot save

"The following object is stored in the GemStone database (most of these are dynamic instance variables -- _id and _oidValue are not):

	(class)@           -> TugrikObject
	(oop)@             -> 673601537
	(invariant)@       -> true
	(committed)@       -> true
	_id@               -> OID(579fdf6a96240ba54f08945d)
	_oidValue@         -> 27118470113675083771403605085
	#instanceOf@       -> #''VOTestPilot''
	#version@          -> 2622850988
	name@              -> ''Dale''

This is the document that is stored in a MongoDB database:

	{
	""_id"" : ObjectId(""579fdf6a96240ba54f08945d""),
	""#instanceOf"" : ""VOTestPilot"",
	""#version"" : NumberLong(""2622850988""),
	""name"" : ''Dale''
	}
	"
'