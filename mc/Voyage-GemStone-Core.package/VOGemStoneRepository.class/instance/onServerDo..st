server blocks
onServerDo: aBlock
	^ resolver
		onServerDo: aBlock
		serializeBlock: [ :anObject | 
			| idObject futures theSerializedObject |
			idObject := self keyOf: anObject ifAbsent: [ OID nextOID ].
			futures := self serializer serialize: anObject id: idObject.
			resolver
				futureWithNewVersion: futures first
				do: [ :id :object :jsonDictionary | 
					theSerializedObject := jsonDictionary
						at: '_id' put: id;
						yourself ].
			{('serializedObj' -> theSerializedObject).
			('collectionName' -> (resolver collectionNameFor: anObject class)).
			('databaseName' -> self databaseName)} asDictionary ]