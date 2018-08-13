import Foundation
import Alamofire

protocol RouterProtocol {
	var path: String { get }
	var method: HTTPMethod { get }
	var encoding: ParameterEncoding { get }
}
