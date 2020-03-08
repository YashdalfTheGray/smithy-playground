$version: "0.5.0"

namespace com.yashdalfthegray.playground

@error("client")
@httpError(400)
struct BadRequestError {
  message: String
}

@error("client")
@httpError(404)
struct NotFoundError {
  message: String
}

@error("server")
@httpError(500)
struct InternalServerError {
  message: String
}
