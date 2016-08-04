instance creation
dbServerClassName: dbServerClassName repository: aRepository
	^ self basicNew
		dbServerClassName: dbServerClassName;
		initialize: aRepository;
		yourself