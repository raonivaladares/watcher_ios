import Foundation
import Alamofire

public struct APIProvider {
	let configuration: APIConfiguration
	let watchServer: WatcherServer
	
	public init() {
		configuration = APIProviderConfiguration()
		watchServer = WatcherServer()
	}
}

extension APIProvider {
	public func getToken() {
		//preparar params
		//execute request
		//parsererror
		//result
		
		let parameters = ["api_key": configuration.apiKey]
		let request = RequestBuilder(
			action: Route.userValidation.requestToken,
      configuration: configuration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request)
		//WatcherServer.ValidationActions.getToken(configuration: configuration, completion: {})
	}
}

//struct ValidationActions {
//	func getToken(configuration: APIConfiguration, completion: () -> Void ) {
//		let parameters = ["api_key": configuration.apiKey]
//		let builder: APIRequestBuilder = APIRequestBuilder(
//			action: Route.userValidation.requestToken,
//			configuration: configuration,
//			parameters: parameters
//		)
//
//	}
//}

