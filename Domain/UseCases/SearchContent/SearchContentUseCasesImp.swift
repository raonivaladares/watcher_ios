import Foundation
import NetworkPlataform
import Result

public struct SearchContentUseCasesImp: SearchContentUseCases {
	private let apiProvider: APIProvider
	
	public init() {
		apiProvider = APIProvider()
	}
	
	public func searchForMovie(queryString: String, completion: @escaping (Result<MovieSearchResult, ViewModelError>) -> Void) {
		apiProvider.searchContentNetwork().searchForMovie(queryString: queryString) { result in
			completion(result.bimap(success: {
				$0.asDomain()
			}, failure: { _ in ViewModelError(title: "a", message: "aaa") }))
			//			completion(result.map { $0 }.mapError(ViewModelError.init))
		}
	}
}
