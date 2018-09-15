import Foundation
import Result

public struct MovieNetwork {
	let watchServer: WatcherServer
	
	public func searchForMovie(quereyString: String, completion: @escaping (Result<[MovieSearchResult], ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.searchContent.searchMovie,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				print(json)
			}, ifFailure: {
				print($0)
			})
		}
	}
}
