private
retrieveObjectFromJson: aDictionary
	(aDictionary isDictionary
		and: [ aDictionary includesKey: VOMongoJSONSerializer fieldType ])
		ifTrue: [ | objectClass |
			objectClass := Smalltalk at: (aDictionary at: VOMongoJSONSerializer fieldType).
			^ self retrieveObjectOf: objectClass json: aDictionary ]
		ifFalse: [ aDictionary ]