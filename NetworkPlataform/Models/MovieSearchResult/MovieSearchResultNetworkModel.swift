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
