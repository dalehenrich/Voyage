queries
createCollection
  super createCollection.
  {(Dictionary new
    at: #'name' put: 'Voyage Basic';
    at: #'order' put: 1;
    at: #'contents' put: self voyageBasicExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block';
    at: #'order' put: 5;
    at: #'contents' put: self voyageServerBlockExample;
    yourself)} do: [ :dict | self doInsert: dict ]