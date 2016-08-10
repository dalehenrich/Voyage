testing
expectedFailures
	"These tests are either failing when the original tests were to 
		- monitor incorrect behavior: #testCrossImageEmbeddedUpdates #testNonRootEmbeddedObjectSharing
		- trigger a nasty problem on server that eventually needs to be fixed: #testServerSideObjectStructure05
		- remind me that it would be interesting to support (eventually): #testServerSideUnsavedObjectStructure01"

	^ super expectedFailures
		, #(#testCrossImageEmbeddedUpdates #testNonRootEmbeddedObjectSharing #testServerSideObjectStructure05 #testServerSideUnsavedObjectStructure01)