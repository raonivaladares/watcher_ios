import Foundation
import Domain.Swift
import Result

public struct GuestSessionNetwork {
	let watchServer: WatcherServer
	
	public func requestGuestSessionToken(completion: @escaping (Result<GuestSession, ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.userValidation.requestGuestSession,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				guard let requestToken = GuestSession(json: json) else {
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
