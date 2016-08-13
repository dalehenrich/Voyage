tests
testVersionGenerator
  | gen repository |
  gen := VOSeedVersionGenerator new.
  repository := self repository.
  repository versionGenerator: gen.
  self assert: gen == repository versionGenerator