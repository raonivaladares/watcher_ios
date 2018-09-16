import Foundation

extension MovieSearchResult {
	public struct Result {
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
