queries
createExampleCollection
  {(Dictionary new
    at: #'name' put: 'Install and Update';
    at: #'order' put: 1;
    at: #'contents' put: self installGitFileTree;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Basic';
    at: #'order' put: 2;
    at: #'contents' put: self voyageBasicExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block';
    at: #'order' put: 5;
    at: #'contents' put: self voyageServerBlockExample;
    yourself).
  (Dictionary new
    at: #'name' put: 'Voyage Server Block Query';
    at: #'order' put: 10;
    at: #'contents' put: self voyageServerBlockQueryExample;
    yourself)} do: [ :dict | self doInsert: dict ]