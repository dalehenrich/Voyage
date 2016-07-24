server blocks
onServerDo: aBlock
	resolver pool withSession: [ :tugrik | ^ tugrik todeClient onServerDo: aBlock ]