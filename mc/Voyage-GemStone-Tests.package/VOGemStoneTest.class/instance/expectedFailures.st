testing
expectedFailures

	^ super expectedFailures copyWithout: #testSelectAllJustAfterRemove "GemStone does not fail"