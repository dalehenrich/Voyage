reseting
resetDescriptionOf: aClass 
	VOGemStoneRepository allSubInstances 
		do: [ :each |	 each resetDescriptionForClass: aClass ]