import Foundation

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
			switch result {
            case .success(let json):
                if let searchResult = MovieSearchResultNetworkModel(json: json) {
                    completion(.success(searchResult))
                }
                completion(.failure(ServerError.invalidJSON))
            case .failure(let error):
                completion(.failure(error))
            }
		}
	}
}
