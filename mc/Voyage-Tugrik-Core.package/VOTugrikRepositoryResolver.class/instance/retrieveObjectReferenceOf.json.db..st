private
retrieveObjectReferenceOf: aClass json: aDictionary db: db
	"assume that we are in an execute: block"

	| json |
	json := (self collectionAt: aClass inDatabase: db)
		detect: (Dictionary with: VOMongoJSONSerializer fieldRootId -> (aDictionary at: VOMongoJSONSerializer fieldId)).
	^ self retrieveObjectOf: aClass json: json