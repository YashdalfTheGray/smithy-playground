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
