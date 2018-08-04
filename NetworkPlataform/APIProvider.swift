import Foundation
import Alamofire

public struct APIProvider {
	let configuration: APIConfiguration
	
	public init() {
		self.configuration = APIProviderConfiguration()
	}
}

extension APIProvider {
	public func getToken() {
		WatcherServer.ValidationActions.getToken(configuration: configuration, completion: {})
	}
}

extension WatcherServer {
	struct ValidationActions {
		static func getToken(configuration: APIConfiguration, completion: () -> Void ) {
			let parameters = ["api_key": configuration.apiKey]
			let builder: APIRequestBuilder = APIRequestBuilder(
				action: Route.userValidation.requestToken,
				configuration: configuration,
				parameters: parameters
			)
			
			Alamofire.request(
				builder.path,
				method: builder.method,
				parameters: builder.parameters,
				encoding: URLEncoding(destination: .queryString),
				headers: nil).response { dataResponse in
					
					if let error = WatcherServer.parseError(dataResponse: dataResponse) {
						
					}
			}
		}
	}
}
