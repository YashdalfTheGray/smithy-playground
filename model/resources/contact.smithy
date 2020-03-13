$version: "0.5.0"

namespace com.yashdalfthegray.playground

@documentation("Create a new contact in the system")
@http(method: "PUT", uri: "/new_contact", code: 201)
@idempotent
operation CreateContact {
  input: CreateContactRequest,
  output: CreateContactResponse,
  errors: [
    BadRequestError,
    ConflictError,
    TooManyRequestsError,
    InternalServerError,
  ]
}

@documentation("The request object for the CreateContact operation")
structure CreateContactRequest {
  @required
  details: ContactDetails,

  @idempotencyToken
  clientToken: String,
}

@documentation("The response object for the CreateContact operation")
structure CreateContactResponse {
  @required
  @httpPayload
  contact: ContactEntry
}

@documentation("Describe an already existing contact in the system")
@http(method: "GET", uri: "/contacts/{contactId}")
@readonly
operation DescribeContact {
  input: DescribeContactRequest,
  output: DescribeContactResponse,
  errors: [
    BadRequestError,
    NotFoundError,
    TooManyRequestsError,
    InternalServerError
  ]
}

@documentation("The request object for the DescribeContact operation")
structure DescribeContactRequest {
  @required
  @httpLabel
  contactId: String
}

@documentation("The response object for the DescribeContact operation")
structure DescribeContactResponse {
  @required
  @httpPayload
  contact: ContactEntry
}

@documentation("Update an already existing contact in the system")
@http(method: "POST", uri: "/contacts/{contactId}")
@idempotent
operation UpdateContact {
  input: UpdateContactRequest,
  output: UpdateContactResponse,
  errors: [
    BadRequestError,
    NotFoundError,
    ConflictError,
    TooManyRequestsError,
    InternalServerError,
  ]
}

@documentation("The request object for the UpdateContact operation")
structure UpdateContactRequest {
  @required
  @httpLabel
  contactId: String,

  @required
  details: ContactDetails,

  @idempotencyToken
  clientToken: String,
}

@documentation("The response object for the UpdateContact operation")
structure UpdateContactResponse {
  @required
  @httpPayload
  contact: ContactEntry
}

@documentation("Delete an already existing contact in the system")
@http(method: "DELETE", uri: "/contacts/{contactId}")
@idempotent
operation DeleteContact {
  input: DeleteContactRequest,
  output: DeleteContactResponse,
  errors: [
    BadRequestError,
    NotFoundError,
    TooManyRequestsError,
    InternalServerError
  ]
}

@documentation("The request object for the DeleteContact operation")
structure DeleteContactRequest {
  @required
  @httpLabel
  contactId: String,

  @idempotencyToken
  clientToken: String,
}

@documentation("The response object for the DeleteContact operation")
structure DeleteContactResponse {
  @required
  @httpPayload
  contact: ContactEntry
}

@documentation("List all contacts in the system")
@http(method: "GET", uri: "/contacts")
@pagination(
  inputToken: "nextToken",
  outputToken: "nextToken",
  pageSize: "limit",
  items: "contacts"
)
operation ListContacts {
  input: ListContactsRequest,
  output: ListContactResponse,
  errors: [BadRequestError, TooManyRequestsError, InternalServerError]
}

@documentation("The request object for the ListContacts operation")
structure ListContactsRequest {
  @httpQuery("limit")
  limit: ListOperationLimit,

  @httpQuery("nextToken")
  nextToken: String,
}

@documentation("The response object for the ListContacts operation")
structure ListContactsResponse {
  @required
  contacts: ContactHeadersList,

  nextToken: String,
}

list ContactHeadersList {
  member: ContactHeader
}

structure ContactHeader {
  @required
  contactId: String,

  @required
  name: String
}

structure ContactEntry {
  @required
  metadata: ResourceMetadata,

  @required
  details: ContactDetails,
}

structure ContactDetails {
  @required
  name: String,

  @required
  email: String,

  @required
  phone: String,
}
