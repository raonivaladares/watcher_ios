import Foundation

public enum ServerError: Error {
	case unkown
	case serverInternalError
	case emptyDataResponse
	case invalidJSON
    case jsonMissingKey(key: String)
	case networkTimedOut
}
