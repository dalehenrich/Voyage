private
retrieveObjectFromJson: aDictionary db: db
	| isRootObject |
	isRootObject := false.
	^ (aDictionary isDictionary
		and: [ (aDictionary includesKey: VOMongoJSONSerializer fieldType)
				and: [ (isRootObject := aDictionary includesKey: VOMongoJSONSerializer fieldRootId)
						or: [ aDictionary includesKey: VOMongoJSONSerializer fieldId ] ] ])
		ifTrue: [ | objectClass |
			objectClass := Smalltalk globals at: (aDictionary at: VOMongoJSONSerializer fieldType) asSymbol.
			isRootObject
				ifTrue: [ self retrieveObjectOf: objectClass json: aDictionary ]
				ifFalse: [ self retrieveObjectReferenceOf: objectClass json: aDictionary db: db ] ]
		ifFalse: [ aDictionary ]