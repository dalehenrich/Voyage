as yet unclassified
retrieveObjectFromJson: anObject
	^ (anObject isDictionary and: [ anObject includesKey: VOGemStoneSerializer fieldType ])
		ifTrue: [ | id cachedVersion retrievedVersion object |
			anObject at: '$err' ifPresent: [ :message | VOMongoError signal: message ].
			id := anObject at: '_id'.
			object := self cacheAt: id.
			cachedVersion := self cacheVersionAt: id.
			retrievedVersion := anObject at: VOGemStoneSerializer fieldVersion ifAbsent: [ 0 ].
			(object isNil or: [ cachedVersion ~= retrievedVersion ])
				ifTrue: [ | objectClass |
					objectClass := Smalltalk at: (anObject at: VOGemStoneSerializer fieldType).
					object
						ifNil: [ object := (self retrieveClassOf: objectClass json: anObject) basicNew.
							self cacheAt: id put: object ].
					self cacheAt: id putVersion: retrievedVersion.
					self materialize: object fromJSON: anObject ].
			object ]
		ifFalse: [ anObject ]