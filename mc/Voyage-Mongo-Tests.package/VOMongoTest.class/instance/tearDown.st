running
tearDown
	"Reset the DB after each test"
	"self repository dropDatabase --> this works but it's slow and... leaks open Sockets!"

	self repository
		removeAll: VOTestPet;
		removeAll: VOTestPilot;
		removeAll: VOTestOwner;
		flush.
	Smalltalk garbageCollect.

	self concurrencyDelay