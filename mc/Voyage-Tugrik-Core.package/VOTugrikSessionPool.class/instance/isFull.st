testing
isFull
	self mutex critical: [ ^ self size = (sessions size + activeSessions size) ]