import Foundation
import Result

public struct ConfigurationNetwork {
	let watchServer: WatcherServer
	
	public func requestAPIConfiguration(completion: @escaping (Result<APIConfigurationNetworkModel, ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.apiConfiguration.configuration,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				if let searchResult = MovieSearchResultNetworkModel(json: json) {
//					completion(.success(searchResult))
				}
				completion(.failure(ServerError.invalidJSON))
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}
