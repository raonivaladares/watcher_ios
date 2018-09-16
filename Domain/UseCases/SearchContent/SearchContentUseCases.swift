import Foundation
import Result

public protocol SearchContentUseCases {
	func searchForMovie(queryString: String, completion: @escaping (Result<MovieSearchResult, ViewModelError>) -> Void)
}

