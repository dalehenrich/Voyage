magritte
descriptionBuilder
  ^ descriptionBuilder
    ifNil: [ descriptionBuilder := VOGemStoneDescriptionBuilder repository: self ]