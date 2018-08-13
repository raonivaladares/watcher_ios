import Foundation
import Alamofire

struct Request: Requestable {
	let path: URL
	let method: HTTPMethod
	let encoding: ParameterEncoding
	let parameters: [String : Any]?
}

protocol Requestable {
	var path: URL { get }
	var method: HTTPMethod { get }
	var encoding: ParameterEncoding { get }
	var parameters: [String: Any]? { get }
}
