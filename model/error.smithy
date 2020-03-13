$version: "0.5.0"

namespace com.yashdalfthegray.playground

@error("client")
@httpError(400)
structure BadRequestError {
  message: String
}

@error("client")
@httpError(404)
structure NotFoundError {
  message: String
}

@error("client")
@httpError(409)
structure ConflictError {
  message: String
}

@error("client")
@httpError(429)
structure TooManyRequestsError {
  message: String
}

@error("server")
@httpError(500)
structure InternalServerError {
  message: String
}
