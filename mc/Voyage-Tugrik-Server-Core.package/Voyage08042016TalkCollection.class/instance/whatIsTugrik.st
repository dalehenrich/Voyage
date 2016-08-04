examples
whatIsTugrik
  ^ '"
Voyage
  - a persistence framework for Pharo constructed as a small layer between objects
    and the persistency mechanism.
  - current implmentations include an in-memory and MongoDb backend.

  MongoDB
    - Voyage uses the MongoTalk project to communicate with a MongoDB database instance.
    - each stored entity is a JSON-style document
    - an object mapper is used to map between objects and documents.       
    - Magritte descriptions may be used to configure the mapper

  Tugrik
    - Tugrik (written by me) implements a MongoTalk compatible Smalltalk API and allows
      a Voyage application written against MongoDB to use a GemStone database as a 
      backend.
    - By default each stored entity is a JSON-style document (instance of Dictionary), but
      I have made extension to Tugrik that allow one to create instances of concrete
      application classes making it possible for developers to run server-side code.

[1] information extracted from the ''Persisting Objects with Voyage'' chapter in the 
    Pharo book: ''Enterprise Pharo a Web Perspective'' 
    (http://files.pharo.org/books/enterprise-pharo/)
"
'