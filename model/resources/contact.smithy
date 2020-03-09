$version: "0.5.0"

namespace com.yashdalfthegray.playground

@documentation("Create a new contact in the system")
@http(method: "PUT", uri: "new_contact", code: 201)
@idempotent
operation CreateContact {
  input: CreateContactRequest,
  output: CreateContactResponse,
  errors: [BadRequestError, NotFoundError, InternalServiceError]
}

@documentation("The request object for the CreateContact operation")
structure CreateContactRequest {
  @required
  details: ContactDetails

  apply ContactDetails$name @resourceIdentifier("contactId")

  @idempotencyToken
  clientToken: String,
}

@documentation("The response object for the CreateContact operation")
structure CreateContactResponse {
  @required
  @httpPayload
  contact: Contact
}

@documentation("Describe an already existing contact in the system")
@http(method: "GET", uri: "contacts/{contactId}")
@readonly
operation DescribeContact {
  input: DescribeContactRequest,
  output: DescribeContactResponse,
  errors: [BadRequestError, NotFoundError, InternalServiceError]
}

@documentation("The request object for the DescribeContact operation")
structure DescribeContactRequest {
  @required
  @httpLabel
  contactId: string
}

@documentation("The response object for the DescribeContact operation")
structure DescribeContactResponse {
  @required
  @httpPayload
  contact: Contact
}

structure Contact {
  @required
  metadata: ResourceMetadata,

  @required
  details: ContactDetails
}

structure ContactDetails {
  @required
  name: String,

  @required
  email: String,

  @required
  phone: String,
}
