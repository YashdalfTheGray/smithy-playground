$version: "0.5.0"

namespace com.yashdalfthegray.playground

use aws.api#arn
use aws.api#arnReference

/// A service that provides access to your contacts
@protocols([{ name: "aws.rest-json-1.1", auth: ["http-bearer"] }])
@auth(["http-bearer"])
service ContactService {
  version: "2020-01-24",
  resources: [Contact]
}

/// A collection of contact data on the same person
@arn(
  template: "contacts/{contactId}",
  noAccount: true
)
resource Contact {
  identifiers: {
    contactId: String
  }
}
