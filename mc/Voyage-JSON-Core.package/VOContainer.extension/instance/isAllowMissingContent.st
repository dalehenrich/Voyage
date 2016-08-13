*Voyage-JSON-Core
isAllowMissingContent
	^self 
		propertyAt:  #allowMissingContent 
		ifAbsent: [ self class defaultAllowMissingContent ]