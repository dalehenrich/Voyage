initialization
initialize 
	super initialize.
	self forceEager: false.
	self versionGenerator: self class defaultVersionGenerator.
	self initializeCache.
	self initializeResolver.
