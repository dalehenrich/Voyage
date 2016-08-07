object creation
descriptionBuilder
  ^ descriptionBuilder
    ifNil: [ descriptionBuilder := VOGemStoneDescriptionBuilder repository: self ]