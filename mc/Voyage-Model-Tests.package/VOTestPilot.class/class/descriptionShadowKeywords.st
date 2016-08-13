voyage
descriptionShadowKeywords
	<voyageDescriptionPlatforms: #(mongo tugrik)>
	^VOMongoShadowDescription new
		accessor: #keywords;
		attributeName: 'keywords_downcase';
		transformationBlock: [:keywords | keywords collect: [:each |  each asLowercase ]];
		yourself