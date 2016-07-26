server blocks
onServerDo: aBlock
	resolver pool withSession: [ :tugrik | ^ tugrik onServerDo: aBlock ]