public enum ServerError: Error {
	case unkown
	case serverInternalError
	case emptyDataResponse
    case invalidJSON
    case jsonWithMissingKey(key: String)
    case jsonWithInvalidInput(key: String)
	case networkTimedOut
}
