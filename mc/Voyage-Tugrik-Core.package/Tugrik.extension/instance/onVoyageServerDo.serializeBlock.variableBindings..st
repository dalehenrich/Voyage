*Voyage-Tugrik-Core
onVoyageServerDo: aBlock serializeBlock: serializeBlock variableBindings: variableBindings
	^ self todeClient
		onVoyageServerDo: aBlock
		serializeBlock: serializeBlock
		variableBindings: variableBindings