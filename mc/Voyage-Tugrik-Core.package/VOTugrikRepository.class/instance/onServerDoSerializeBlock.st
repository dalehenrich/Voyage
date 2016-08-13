server blocks
onServerDoSerializeBlock
	^ [ :anObject | 
	anObject class isVoyageRoot
		ifTrue: [ | idObject futures theSerializedObject |
			idObject := self keyOf: anObject ifAbsent: [ OID nextOID ].
			futures := self newSerializer serialize: anObject id: idObject.
			resolver
				futureWithNewVersion: futures first
				do: [ :id :object :jsonDictionary | 
					theSerializedObject := jsonDictionary
						at: '_id' put: id;
						yourself ].
			{('serializedObj' -> theSerializedObject).
			('collectionName' -> (resolver collectionNameFor: anObject class)).
			('databaseName' -> self databaseName)} asDictionary ]
		ifFalse: [ {('serializedObj' -> anObject)} asDictionary ] ]