reseting
resetDescriptionOf: aClass 
	VOTugrikRepository allSubInstances 
		do: [ :each |	 each resetDescriptionForClass: aClass ]