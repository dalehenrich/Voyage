*Voyage-Tugrik-Core
onVoyageServerDo: aBlock serializeBlock: serializeBlock
	^ self
		onServerDo: aBlock
		serializeBlock: serializeBlock
		serverSelector: #evaluateSTONSmalltalk:voyageVariableBindings: