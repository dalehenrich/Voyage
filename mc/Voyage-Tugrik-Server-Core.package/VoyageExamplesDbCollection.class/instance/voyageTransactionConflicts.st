examples
voyageTransactionConflicts
  ^ '"Copy this server block into another Playground. Run 1 (confirmation dialog pops up), Run 2. (confirmation dialog pops up). Click yes on then the other confirmation dialog to create a conflict. A TransactionError will be signalled on server and a server-side debugger will come up."
[ 
	VORepository current abort.
	Smalltalk at: #''_TUGRIK_X'' put: 1.
	self confirm: ''Are you ready to commit?''.
	VORepository current commit.
	Smalltalk at: #''_TUGRIK_X''
	] voyageDoOnServer.

"You can also have a client-side error handler for Transaction errors"
[ [ VORepository current abort.
	Smalltalk at: #_TUGRIK_X put: 2.
	self confirm: ''Are you ready to commit?''.
	VORepository current commit.
	Smalltalk at: #_TUGRIK_X ] voyageDoOnServer ]
		on: TDRuntimeTransactionError
		do: [ :ex | self confirm: ''Transaction error: '', ex description ]'