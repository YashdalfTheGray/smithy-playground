$version: "0.5.0"

namespace com.yashdalfthegray.playground

@documentation("Create a new contact in the system")
@http(method: "PUT", uri: "/new_contact", code: 201)
@idempotent
operation CreateContact {
  input: CreateContactRequest,
  output: CreateContactResponse,
  errors: [BadRequestError, NotFoundError, InternalServerError]
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
  errors: [BadRequestError, NotFoundError, InternalServerError]
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
operation UpdateContact {
  input: UpdateContactRequest,
  output: UpdateContactResponse,
  errors: [BadRequestError, NotFoundError, InternalServerError]
}

@documentation("the request object for the UpdateContact operation")
structure UpdateContactRequest {
  @required
  @httpLabel
  contactId: String

  @required
  details: ContactDetails
}

@documentation("The response object for the UpdateContact operation")
structure UpdateContactResponse {
  @required
  @httpPayload
  contact: ContactEntry
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
