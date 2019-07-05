import Foundation
import Alamofire
//import enum Result.Result
import SwiftyJSON

struct WatcherServer {
	let serverErrorParser: WatcherServerErrorParser
	let apiConfiguration: APIProviderConfiguration
	
	init(apiConfiguration: APIProviderConfiguration) {
		serverErrorParser = WatcherServerErrorParser()
		self.apiConfiguration = apiConfiguration
	}
	
	func execute(request: Requestable, completion: @escaping (Result<JSON, ServerError>) -> Void) {
        Alamofire.AF.request(
			request.path,
			method: request.method,
			parameters: request.parameters,
			encoding: request.encoding,
			headers: nil).response { dataResponse in
				if let error = self.serverErrorParser.parse(dataResponse: dataResponse) {
					completion(.failure(error))
				}
				
				guard let data = dataResponse.data else {
					completion(.failure(ServerError.emptyDataResponse))
					return
				}
				
				let json = JSON(data)
				completion(.success(json))
		}
	}
}
