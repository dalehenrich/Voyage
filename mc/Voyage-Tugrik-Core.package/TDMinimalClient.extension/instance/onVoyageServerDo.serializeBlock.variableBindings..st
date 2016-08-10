*Voyage-Tugrik-Core
onVoyageServerDo: aBlock serializeBlock: serializeBlock variableBindings: variableBindings
	^ self
		onServerDo: aBlock
		serializeBlock: serializeBlock
		serverSelector: #evaluateSTONSmalltalk:voyageVariableBindings:
		variableBindings: variableBindings