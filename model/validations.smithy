$version: "0.5.0"

metadata validators = [
  { name: "AbbreviationName" },
  { name: "CamelCase" },
  {
    name: "StandardOperationVerb",
    configuration: {
      verbs: ["Create", "Describe", "Update", "Delete", "List"],
      prefixes: ["Batch"]
    }
  },
  { name: "StutteredShapeName" },
  { name: "InputOutputStructureReuse" },
  { name: "MissingPaginatedTrait" },
  { name: "ShouldHaveUsedTimestamp" },
  { name: "UnreferencedShape" },
]
