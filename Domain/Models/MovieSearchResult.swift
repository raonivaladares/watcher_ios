import Foundation

public struct MovieSearchResult {
	public let page: Int
	public let movies: [Movie]
	public let totalResults: Int
	public let totalPages: Int
}

extension MovieSearchResult {
	public struct Movie {
		public let serverID: Int
		public let title: String
		public let backdropPath: String?
		public let releaseDate: Date
		
		public init (serverID: Int, title: String, backdropPath: String?, releaseDate: Date) {
			self.serverID = serverID
			self.title = title
			self.backdropPath = backdropPath
			self.releaseDate = releaseDate
		}
	}
}
