import Foundation
import Result

public struct ConfigurationNetwork {
	let watchServer: WatcherServer
	
	public func requestAPIConfiguration(completion: @escaping (Result<APIConfigurationNetworkModel, ServerError>) -> Void) {
		
		let parameters = ["api_key": watchServer.apiConfiguration.apiKey]
		let request = RequestBuilder(
			action: RouterAction.apiConfiguration.configuration,
			configuration: watchServer.apiConfiguration
			)
			.parameters(parameters: parameters)
			.build()
		
		watchServer.execute(request: request) { result in
			result.analysis(ifSuccess: { json in
				if let searchResult = MovieSearchResultNetworkModel(json: json) {
//					completion(.success(searchResult))
				}
				completion(.failure(ServerError.invalidJSON))
			}, ifFailure: {
				completion(.failure($0))
			})
		}
	}
}

public struct APIConfigurationNetworkModel {
	let images: Images?
}

import SwiftyJSON
extension APIConfigurationNetworkModel {
	init(json: JSON) {
		//todo json["images"]
		images = Images(json: json)
	}
}

extension APIConfigurationNetworkModel {
	public struct Images {
		let secureBaseURL: String
		let backDropSizes: [String]
	}
}

extension APIConfigurationNetworkModel.Images {
	init?(json: JSON) {
		
		guard
			let secureBaseURL = json["secure_base_url"].string,
			let sizes = json["backdrop_sizes"].array
		else { return nil }
		
		self.secureBaseURL = secureBaseURL
		backDropSizes = sizes.compactMap { $0.string }
	}
}
