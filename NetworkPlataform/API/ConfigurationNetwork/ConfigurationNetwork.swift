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
                } catch let error as ModelError {
                    //ParseError here
                    let serverError = WatcherServerErrorParser().parse(modelError: error)
                    completion(.failure(serverError))
                } catch {
                    completion(.failure(ServerError.unkown))
                }
                
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}
