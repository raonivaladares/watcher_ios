import Foundation
import Result

public struct GuestSessionNetwork {
	let watchServer: WatcherServer
	
	public func requestGuestSessionToken(completion: @escaping (Result<GuestSessionNetworkModel, ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.userValidation.requestGuestSession,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				guard let requestToken = GuestSessionNetworkModel(json: json) else {
					completion(.failure(ServerError.invalidJSON))
					return
				}
				
				completion(.success(requestToken))
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}
