import Foundation

enum ServerError: Error {
	case unkown
	case serverInternalError
	case emptyDataResponse
	case networkTimedOut
}
