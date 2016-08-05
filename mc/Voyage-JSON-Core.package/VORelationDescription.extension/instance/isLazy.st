*Voyage-JSON-Core
isLazy 
	^self 
		propertyAt:  #lazy
		ifAbsent: [ self class defaultLazy ]