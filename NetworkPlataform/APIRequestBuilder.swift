import Foundation
import Alamofire

struct APIRequestBuilder {
	private let configuration: APIConfiguration
	
	let path: URL
	let method: HTTPMethod
	let parameters: [String: Any]?
	
	init(action: RouterProtocol, configuration: APIConfiguration, parameters: [String: Any]? = nil) {
		path = configuration.apiBaseURL.appendingPathComponent(action.path)
		method = action.method
		self.configuration = configuration
		self.parameters = parameters
	}
}
