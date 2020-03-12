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
  {
    name: "EmitEachSelector",
    id: "ConsistentOperationRequesttName",
    message: "This shape is referenced as input but the name does not end with 'Request'",
    configuration: {
      selector: "operation -[input]-> :not([id|name$=Request])"
    }
  },
  {
    name: "EmitEachSelector",
    id: "ConsistentOperationResponseName",
    message: "This shape is referenced as output but the name does not end with 'Response'",
    configuration: {
      selector: "operation -[output]-> :not([id|name$=Response])"
    }
  },
  {
    name: "EmitEachSelector",
    id: "ConsistentErrorStructureName",
    message: "This structure contains the error trait but does not end with 'Error'",
    configuration: {
      selector: "structure[trait|error] :not([id|name$=Error])"
    }
  }
]
