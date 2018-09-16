import Foundation
import SwiftyJSON

extension MovieSearchResultNetworkModel {
	public struct Result {
		public let serverID: Int
		public let title: String
		public let backdropPath: String?
		public let releaseDate: Date
		
		init?(json: JSON) {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-MM-dd"
			
			guard
				let serverID = json["id"].int,
				let title = json["title"].string,
				let releaseDateRawValue = json["release_date"].string,
				let releaseDate = dateFormatter.date(from: releaseDateRawValue) else {
					
					return nil
			}
			
			self.serverID = serverID
			self.title = title
			self.backdropPath = json["backdrop_path"].string
			self.releaseDate = releaseDate
		}
	}
}
