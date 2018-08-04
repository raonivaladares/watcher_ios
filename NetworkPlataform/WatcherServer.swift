import Foundation
import Alamofire

struct WatcherServer {
	enum ServerError: Error {
		case unkown
		case serverInternalError
		case networkTimedOut
	}
	
	private init() {}
	
	static func parseError(dataResponse: DefaultDataResponse) -> Error? {
		guard let response = dataResponse.response,
					let data = dataResponse.data else {
			
						return ServerError.unkown
		}
		
		return parseError(reponse: response, data: data)
	}
	
	private static func parseError(reponse response: HTTPURLResponse, data responseData: Any) -> Error? {
		switch response.statusCode {
		case 200, 201, 202, 204:
			return nil
		case 401:
			return ServerError.unkown//ServerError.missingAPIKey
		case 400, 404:
			return ServerError.networkTimedOut
		case 403:
			return ServerError.unkown//ServerError.accessDenied
		case 500, 501, 502, 503, 504:
			return ServerError.serverInternalError
		case 599:
			return ServerError.networkTimedOut
		default:
			return ServerError.unkown
		}
	}
}
