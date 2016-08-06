private
retrieveObjectFromJson: aDictionary
	^ (aDictionary isDictionary
		and: [ (aDictionary includesKey: VOMongoJSONSerializer fieldType) and: [ aDictionary includesKey: VOMongoJSONSerializer fieldRootId ] ])
		ifTrue: [ | objectClass |
			objectClass := Smalltalk globals at: (aDictionary at: VOMongoJSONSerializer fieldType) asSymbol.
			self retrieveObjectOf: objectClass json: aDictionary ]
		ifFalse: [ aDictionary ]