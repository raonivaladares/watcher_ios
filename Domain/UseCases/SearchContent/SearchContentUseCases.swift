import Foundation

public protocol SearchContentUseCases {
	func searchForMovie(queryString: String, completion: @escaping (Result<MovieSearchResult, DomainError>) -> Void)
}

