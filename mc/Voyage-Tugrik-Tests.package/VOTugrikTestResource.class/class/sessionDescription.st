gemstone
sessionDescription
	^ SessionDescription
		ifNil: [ SessionDescription := GsGciSessionDescription
				importFrom:
					GsDevKit_home / 'sys' / 'local' / 'sessions'
						/ SCIGemStoneServerConfigSpec defaultSessionName ]