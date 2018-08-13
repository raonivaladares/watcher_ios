import Foundation
import Domain.Swift
import Result

public struct TokenNetwork {
	let watchServer: WatcherServer
	
	public func requestAPIToken(completion: @escaping (Result<RequestToken, ServerError>) -> Void) {
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.userValidation.requestToken,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				guard let requestToken = RequestToken(json: json) else {
					completion(.failure(ServerError.invalidJSON))//Parse
					return
				}

				completion(.success(requestToken))
			}, ifFailure: {
					completion(.failure($0))
			})
		}
	}
}
