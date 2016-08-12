examples
voyageTransactionConflicts
  ^ '"Copy the workspace into another Playground. Run 1 (debugger pops up), Run 2. (debugger pops up). Proceed 1 and Proceed 2"
[ 
	VORepository current abort.
	Smalltalk at: #''_TUGRIK_X'' put: ''1''.
	self halt.
	VORepository current commit.
	Smalltalk at: #''_TUGRIK_X''
	] voyageDoOnServer'