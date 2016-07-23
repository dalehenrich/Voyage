running
tearDown
	"Reset the DB after each test"

	[self repository
		dropDatabase;
		flush] on: GsGciLostSessionError do: [:ex | self inform: 'GemStone session lost during teardown'].
	Smalltalk garbageCollect