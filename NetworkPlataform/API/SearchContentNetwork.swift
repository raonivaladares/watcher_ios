import Foundation
import Result

public struct SearchContentNetwork {
	let watchServer: WatcherServer
	
	public func searchForMovie(queryString: String, completion: @escaping (Result<MovieSearchResultNetworkModel, ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey, "query": queryString]
		let request = RequestBuilder(
			action: RouterAction.searchContent.searchMovie,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				if let searchResult = MovieSearchResultNetworkModel(json: json) {
					completion(.success(searchResult))
				}
				completion(.failure(ServerError.invalidJSON))
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}
