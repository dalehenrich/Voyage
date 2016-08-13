initialization
initialize
  "self initialize"

  "In a transactional system, cannot rely on lazy initialization for persistent state ... an abort before a commit will undo everything"

  self setRepository: nil	"make sure that RepositoryContainer and RepositoryContainerClass class vars are committed"