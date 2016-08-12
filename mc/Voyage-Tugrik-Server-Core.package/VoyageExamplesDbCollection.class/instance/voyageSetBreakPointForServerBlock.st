examples
voyageSetBreakPointForServerBlock
  ^ 'VORepository current resolver pool withSession: [ :tugrik | 
	VORepository current evaluateTodeCommands: ''break set TDTopezServer>>commitTransaction 1''.
	VORepository current
		onServerDo: [ 
			"server code to trip breakpoint"
		] 
		withSession: tugrik].
'