import Foundation
import Alamofire

struct WatcherServerErrorParser {
    func parse(dataResponse: DataResponse<Data?>) -> ServerError? {
		guard let response = dataResponse.response,
			let data = dataResponse.data else {
				
				return ServerError.unkown
		}
		
		return parse(reponse: response, data: data)
	}
	
	private func parse(reponse response: HTTPURLResponse, data responseData: Any) -> ServerError? {
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
    
    #warning("Refactor this using classes")
    func parse(modelError: ModelError) -> ServerError {
        switch modelError {
        case .jsonWithMissingKey(let key): return ServerError.jsonWithMissingKey(key: key)
        case .jsonWithInvalidInput(let key): return ServerError.jsonWithInvalidInput(key: key)
        }
    }
}
