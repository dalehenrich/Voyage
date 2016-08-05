*Voyage-JSON
isLazy 
	^self 
		propertyAt:  #lazy
		ifAbsent: [ self class defaultLazy ]