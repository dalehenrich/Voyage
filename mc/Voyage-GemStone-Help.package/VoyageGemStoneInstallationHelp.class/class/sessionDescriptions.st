pages
sessionDescriptions
	^ HelpTopic 
		title: 'Session Descriptions'
		contents: 
'When a stone is created using the `createStone` command, GsDevKit_home creates a session description object in a file named `$GS_HOME/sys/local/sessions/<stone-name>`. The session description object is written in STON format[1] and looks like the following:

	TDSessionDescription {
		#name : ''Voyage'',
		#stoneHost : ''foos'',
		#stoneName : ''Voyage'',
		#gemHost : ''foos'',
		#netLDI : ''Voyage_ldi'',
		#netLDIPort : '''',
		#gemTask : ''gemnetobject'',
		#userId : ''DataCurator'',
		#password : ''swordfish'',
		#osUserId : nil,
		#osPassword : nil,
		#dataDirectory : nil,
		#backupDirectory : ''/export/foos1/users/dhenrich/dev/_home/server/stones/Voyage/backups/'',
		#snapshotDirectory : ''/export/foos1/users/dhenrich/dev/_home/server/stones/Voyage/snapshots/'',
		#gemstoneVersion : ''3.3.0'',
		#gciLibraryName : nil,
		#adornmentColor : nil,
		#serverGitRoot : nil,
		#serverTodeRoot : ''/export/foos1/users/dhenrich/dev/_home'',
		#authorId : nil
	}

The session description provides all of the information that a client needs to log into a stone. 

The session description instance is loaded from disk using the following expression:

	TDSessionDescription importFrom: GsDevKit_home / ''sys'' / ''local'' / ''sessions'' / ''<session-description-name>''

When starting a GsDevKit_home client, the `-s` option allows you to specify a default session description name:

	startClient voyage -s Voyage

The default session description can then be created by using the following expression:

	TDSessionDescription importFrom: GsDevKit_home / ''sys'' / ''local'' / ''sessions'' / SCIGemStoneServerConfigSpec defaultSessionName

[1] https://github.com/svenvc/ston/blob/master/ston-paper.md#smalltalk-object-notation-ston
'