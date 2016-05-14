running
tearDown
	"Reset the DB after each test"

	self repository
		dropDatabase;
		flush.
	Smalltalk garbageCollect