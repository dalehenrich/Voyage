server blocks
onServerDo: aBlock
	^ resolver
		onServerDo: aBlock
		serializeBlock: [ :anObject | 
			| idObject |
			idObject := self keyOf: anObject ifAbsent: [ OID nextOID ].
			self serializer serialize: anObject id: idObject ]