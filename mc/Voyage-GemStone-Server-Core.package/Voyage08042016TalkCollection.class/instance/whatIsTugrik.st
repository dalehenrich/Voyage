examples
whatIsTugrik
  ^ '"
Voyage
  - a persistence framework for Pharo constructed as a small layer between objects
    and persistency mechanism.
  - current implmentations include an in-memory and MongoDb backend.

  MongoDB
    - Voyage uses the MongoTalk project to communicate with a MongoDB database instance.
    - each stored entity is a JSON-style document
    - an object mapper is used to map between objects and documents
    - the mapper does not solve all of the impedance mismatch issues 
      when going from objects to a database
    - Magritte descriptions may be used to configure the mapper

  Tugrik
    - Tugrik (written by me) implements a MongoTalk compatible Smalltalk API and allows
      a Voyage application written against MongoDB to use a GemStone database as a 
      backend.
    - By default each stored entity is a JSON-style document (instance of Dictionary).

[1] information extracted from the ''Persisting Objects with Voyage'' chapter in the 
    Pharo book: ''Enterprise Pharo a Web Perspective'' 
    (http://files.pharo.org/books/enterprise-pharo/)
"
'