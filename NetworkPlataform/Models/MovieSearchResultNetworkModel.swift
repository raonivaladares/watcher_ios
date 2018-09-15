import Foundation
import SwiftyJSON

public struct MovieSearchResultNetworkModel {
	public let page: Int
	public let results: [Result]
	public let totalResults: Int
	public let totalPages: Int
	
	init?(json: JSON) {
		guard
			let page = json["page"].int,
			let resultsJSONArray = json["results"].array,
			let totalResults = json["total_results"].int,
			let totalPages = json["total_pages"].int else {
				
				return nil
		}
		
		self.page = page
		self.results = resultsJSONArray.compactMap(Result.init)
		self.totalResults = totalResults
		self.totalPages = totalPages
	}
}

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
