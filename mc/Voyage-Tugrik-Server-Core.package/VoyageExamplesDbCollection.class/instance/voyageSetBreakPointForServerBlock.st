examples
voyageSetBreakPointForServerBlock
  ^ 'VORepository current resolver pool withSession: [ :tugrik | 
	tugrik todeClient evaluateCommand: ''break set TDTopezServer>>commitTransaction''.
	self 
		onServerDo: [ "server block to trigger breakpoint" ] 
		serializeBlock: VORepository current onServerDoSerializeBlock 		withSession: tugrik].
'