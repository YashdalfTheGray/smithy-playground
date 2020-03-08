$version: "0.5.0"

namespace com.yashdalfthegray.playground

@documentation("Create a new contact in the system")
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
