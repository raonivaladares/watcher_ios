import Foundation

public struct MovieSearchResult {
	public let page: Int
	public let results: [Result]
	public let totalResults: Int
	public let totalPages: Int
}

import NetworkPlataform
extension MovieSearchResultNetworkModel {
	func asDomain() -> MovieSearchResult {
		let resultsAsDomain: [MovieSearchResult.Result] = results.map { $0.asDomain() }
		return MovieSearchResult(page: page, results: resultsAsDomain, totalResults: totalPages, totalPages: totalPages)
	}
}

extension MovieSearchResultNetworkModel.Result {
	func asDomain() -> MovieSearchResult.Result {
		return MovieSearchResult.Result(serverID: serverID, title: title, backdropPath: backdropPath, releaseDate: releaseDate)
	}
}
