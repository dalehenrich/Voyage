initialization
populate
	self mutex
		critical: [ self isPopulating
				ifFalse: [ populating := true.
					[ self size
						timesRepeat: [ self isFull
								ifFalse: [ self returnToPool: (self ensureConnected: self newSession) ] ] ]
						ensure: [ populating := false ] ] ]