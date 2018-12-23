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
                do {
                    let configuration = try APIConfigurationNetworkModel(json: json)
                    completion(.success(configuration))
                } catch {
                    //ParseError here
                    completion(.failure(ServerError.jsonMissingKey(key: "xxx")))
                }
				completion(.failure(ServerError.invalidJSON))
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}
