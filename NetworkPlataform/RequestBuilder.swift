import Foundation
import Alamofire

class RequestBuilder {
	let action: RouterProtocol
	let configuration: APIConfiguration
	var parameters: [String : Any]?
	
	init(action: RouterProtocol, configuration: APIConfiguration) {
		self.action = action
		self.configuration = configuration
	}
	
	func parameters(parameters: [String : Any]) -> RequestBuilder {
		self.parameters = parameters
		
		return self
	}
	
	func build() -> Requestable {
		let path = configuration.apiBaseURL.appendingPathComponent(action.path)
		return Request(path: path, method: action.method, encoding: action.encoding, parameters: parameters)
	}
}
