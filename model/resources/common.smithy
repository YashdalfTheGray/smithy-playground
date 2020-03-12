$version: "0.5.0"

namespace com.yashdalfthegray.playground

structure ResourceMetadata {
  @required
  uuid: String,

  @required
  createdAt: Timestamp,

  @required
  lastModifiedAt: Timestamp,
}

@range(min: 1, max: 100)
integer ListOperationLimit
