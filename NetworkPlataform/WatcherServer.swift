import Foundation
import Alamofire

enum ServerError: Error {
	case unkown
	case serverInternalError
	case networkTimedOut
}

struct WatcherServer {
	let serverErrorParser: WatcherServerErrorParser
	let apiConfiguration: APIProviderConfiguration
	
	init() {
		serverErrorParser = WatcherServerErrorParser()
		apiConfiguration = APIProviderConfiguration()
	}
	
	func execute(request: Requestable) {
		Alamofire.request(
			request.path,
			method: request.method,
			parameters: request.parameters,
			encoding: request.encoding,
			headers: nil).response { dataResponse in
				
				print(dataResponse)
				if let error = self.serverErrorParser.parse(dataResponse: dataResponse) {
					
				}
		}
	}
}
